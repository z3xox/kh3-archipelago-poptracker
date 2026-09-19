#!/usr/bin/env python3
"""
Generate locations/ingredients.json and locations/ingredients_plus.json.

The apworld's `ingredients` option adds two mutually exclusive pools:

  Ingredientsanity   59 "Ingredients - <name>" checks, one per ingredient, for
                     the first time you pick that ingredient up in the field.
                     Its sources are spread across several worlds, so these get
                     no map pin -- they're a flat list.

  Ingredientsanity+  298 "Ingredients+ - <World> - Pickup NNN" checks, one per
                     physical pickup spot.

For the spots, the apworld ships `data/ingredient_logic_dependencies.json`,
which anchors every spot to a nearby chest ("the nearest distinct chest in each
authored actor map"). That gives us two things for free: the anchor chest is
already a tracker pin with real coordinates, and its access rule is already
authored. So each spot inherits both from its anchor.

Crucially the anchors are shared: 298 spots resolve to only 114 distinct chests,
with up to 12 spots on one chest. Stacking 12 pins on identical coordinates
would be unusable, so spots sharing an anchor become *one* pin carrying several
sections -- the same shape as the hand-curated clusters in location_names.json
("Huddled Isles - Chests 1+21+22") and as "Re Mind - Story Battles".

The positions are only as good as the apworld's anchors, which it describes as
"approximate access anchors [...] not verified physical routes". Treat them as
indicative and refine by hand as reports come in; re-running this script will
not clobber hand edits to unrelated files, but it does rewrite both generated
location files wholesale.

Usage:
    python scripts/tools/generate_ingredient_locations.py
    python scripts/tools/generate_ingredient_locations.py --dry-run
"""
import argparse
import json
import re
import zipfile
from collections import OrderedDict, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
APWORLD = ROOT / "kh3.apworld"
CATALOG = ROOT / "scripts" / "tools" / "extracted_locations.json"
LOCATIONS_DIR = ROOT / "locations"
LOCATION_MAPPING_LUA = ROOT / "scripts" / "autotracking" / "location_mapping.lua"

INGREDIENTS_FILE = LOCATIONS_DIR / "ingredients.json"
INGREDIENTS_PLUS_FILE = LOCATIONS_DIR / "ingredients_plus.json"

DEPENDENCIES_RESOURCE = "kh3/data/ingredient_logic_dependencies.json"
MAPS_FILE = ROOT / "maps" / "maps.json"

# An ingredient pin inherits its anchor chest's coordinates, so drawn as-is it
# lands exactly on top of that chest and is invisible underneath it. Nudge it
# diagonally by one marker width and give it a shape no other pin type uses
# (chests are rect, events diamond) so the two read as separate markers.
PIN_SHAPE = "trapezoid"
DEFAULT_LOCATION_SIZE = 16
CODE_RE = re.compile(r'\[(\d+)\]\s*=\s*\{\s*code\s*=\s*"([^"]+)"')


def load_location_sizes() -> dict[str, int]:
    """Marker size per map, so the offset scales with how big the pins are."""
    return {
        entry["name"]: int(entry.get("location_size") or DEFAULT_LOCATION_SIZE)
        for entry in json.loads(MAPS_FILE.read_text(encoding="utf-8"))
    }


def offset_pin(map_locations: list[dict], sizes: dict[str, int]) -> list[dict]:
    nudged = []
    for position in map_locations:
        step = sizes.get(position.get("map"), DEFAULT_LOCATION_SIZE)
        nudged.append({
            **position,
            "x": int(position["x"]) + step,
            "y": int(position["y"]) + step,
            "shape": PIN_SHAPE,
        })
    return nudged


def load_dependencies() -> dict:
    with zipfile.ZipFile(APWORLD) as archive:
        return json.loads(archive.read(DEPENDENCIES_RESOURCE).decode("utf-8"))


def index_sections() -> tuple[dict, dict]:
    """section name -> its map_locations / access_rules, and -> its world root rules."""
    details, world_rules = {}, {}

    def visit(node, root_rules):
        if isinstance(node, list):
            for child in node:
                visit(child, root_rules)
            return
        if not isinstance(node, dict):
            return
        for section in node.get("sections", []) or []:
            name = section.get("name")
            # A section carrying "ref" is a mirror of one defined elsewhere -- in
            # this pack, the Caribbean "(Sea Map)" overview locations re-list every
            # island's chests at a single sea-map coordinate. Indexing those would
            # overwrite each chest's real island position with the overview pin.
            if name and "ref" not in section:
                details[name] = {
                    "map_locations": node.get("map_locations") or [],
                    "access_rules": section.get("access_rules") or [],
                }
                world_rules[name] = root_rules
        for child in node.get("children", []) or []:
            visit(child, root_rules)

    for path in sorted(LOCATIONS_DIR.glob("*_chests.json")):
        for root in json.loads(path.read_text(encoding="utf-8")):
            visit(root, root.get("access_rules") or [])
    return details, world_rules


def build() -> tuple[list, list, dict]:
    catalog = json.loads(CATALOG.read_text(encoding="utf-8"))
    base = catalog["meta"]["base_location_id"]
    locations = catalog["locations"]

    id_by_key = {(l["source_table"], l["source_id"]): base + i for i, l in enumerate(locations)}
    mapping = dict(
        (int(ap_id), code)
        for ap_id, code in CODE_RE.findall(LOCATION_MAPPING_LUA.read_text(encoding="utf-8"))
    )
    details, world_rules = index_sections()
    dependencies = load_dependencies()["spots"]

    # --- Ingredientsanity: flat list, skipping the ones AP never enables -----
    plain = []
    for index, location in enumerate(locations):
        if location.get("type") != "ingredient" or location["source_table"] != "Ingredient":
            continue
        if location.get("ap_enabled") is False:
            continue
        plain.append((base + index, location.get("location_description") or location["name"]))

    # --- Ingredientsanity+: one pin per anchor chest -------------------------
    clusters = defaultdict(list)
    unresolved = []
    for index, location in enumerate(locations):
        if location.get("type") != "ingredient" or location["source_table"] != "IngredientSpot":
            continue
        ap_id = base + index
        name = location.get("location_description") or location["name"]
        anchors = dependencies.get(location["source_id"]) or []
        anchor_section = None
        for anchor in anchors:
            table, source_id = anchor.split(":", 1)
            anchor_id = id_by_key.get((table, source_id))
            code = mapping.get(anchor_id) if anchor_id is not None else None
            if code is None:
                continue
            candidate = code.split("/", 1)[1]
            if details.get(candidate, {}).get("map_locations"):
                anchor_section = candidate
                break
        if anchor_section is None:
            unresolved.append((ap_id, name, anchors))
            continue
        clusters[anchor_section].append((ap_id, name, location["world"], _spot_world(name)))

    return plain, sorted(clusters.items()), {"unresolved": unresolved, "details": details,
                                             "world_rules": world_rules,
                                             "sizes": load_location_sizes()}


def _spot_world(name: str) -> str:
    match = re.match(r"Ingredients\+ - (.*) - Pickup", name)
    return match.group(1) if match else "Ingredients"


def render(plain, clusters, context) -> tuple[list, list, dict]:
    details, world_rules = context["details"], context["world_rules"]

    # The pool gate has to hide, not just grey out: with the option off these
    # locations are not in the seed at all (Data.filter_locations_for_options).
    ingredients_doc = [{
        "name": "Ingredients",
        "access_rules": ["active_ingredients"],
        "visibility_rules": ["active_ingredients"],
        "children": [{
            "name": "Ingredients - First Pickups",
            "sections": [{"name": name, "item_count": 1} for _ap_id, name in plain],
            "map_locations": [],
        }],
    }]

    # Two anchor chests can sit on the exact same coordinate (the pack already
    # curates such clusters by hand, e.g. "Huddled Isles - Chests 1+21+22").
    # Offsetting both would just stack them again, so merge them into one pin.
    merged = OrderedDict()
    for anchor_section, spots in clusters:
        anchor = details[anchor_section]
        position = offset_pin(anchor["map_locations"], context["sizes"])
        key = tuple((m["map"], m["x"], m["y"]) for m in position)
        bucket = merged.setdefault(key, {"anchors": [], "spots": [], "position": position,
                                         "rules": anchor["access_rules"], "world": spots[0][3]})
        bucket["anchors"].append(anchor_section)
        bucket["spots"].extend(spots)

    by_world = OrderedDict()
    pins = {}
    for bucket in merged.values():
        pin_name = f"Ingredients+ - {_merge_names(bucket['anchors'])}"
        entry = {
            "name": pin_name,
            "sections": [{"name": name, "item_count": 1} for _ap_id, name, _w, _sw in bucket["spots"]],
            "map_locations": bucket["position"],
        }
        if bucket["rules"]:
            entry["access_rules"] = bucket["rules"]
        by_world.setdefault(bucket["world"], []).append(entry)
        for ap_id, name, _w, _sw in bucket["spots"]:
            pins[ap_id] = (pin_name, name)

    plus_doc = []
    for world in sorted(by_world):
        # Mirror the world's own chest-root gate (portal keyblade, tier, ...).
        root_rules = _world_root_rules(by_world[world], world_rules)
        rules = ["active_ingredients_plus"] + root_rules
        plus_doc.append({
            "name": f"Ingredients+ - {world}",
            "access_rules": [",".join(rules)],
            "visibility_rules": ["active_ingredients_plus"],
            "children": by_world[world],
        })
    return ingredients_doc, plus_doc, pins


def _merge_names(anchors: list[str]) -> str:
    """"A - Small Chest 10" + "A - Small Chest 22" -> "A - Small Chest 10+22"."""
    if len(anchors) == 1:
        return anchors[0]
    heads = {anchor.rsplit(" ", 1)[0] for anchor in anchors}
    if len(heads) == 1:
        tails = "+".join(anchor.rsplit(" ", 1)[1] for anchor in anchors)
        return f"{heads.pop()} {tails}"
    return " + ".join(anchors)


def _world_root_rules(entries, world_rules) -> list[str]:
    """The chest-root *reachability* rules of the world these anchors came from.

    Every anchor in a world comes from that world's own chest file, so any one
    of them resolves to the same root rules.

    The world's own pool gate is stripped out: ingredient locations carry the
    world "Ingredients", which is in neither WORLD_LOCATION_POOL_OPTIONS nor
    REWARD_LOCATION_POOL_OPTIONS, so uses_replace_location_pool never drops
    them, and filter_locations_for_options doesn't gate them on a world's pool
    value either. What we want from the chest root is only how you physically
    get there.
    """
    for entry in entries:
        rules = world_rules.get(entry["name"].removeprefix("Ingredients+ - "))
        if not rules:
            continue
        kept = []
        for rule in rules:
            clauses = [c for c in rule.split(",") if not c.strip().startswith("active_")]
            if clauses:
                kept.append(",".join(clauses))
        return kept
    return []


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__,
                                     formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--dry-run", action="store_true")
    args = parser.parse_args()

    plain, clusters, context = build()
    ingredients_doc, plus_doc, pins = render(plain, clusters, context)

    spot_total = sum(len(entry["sections"]) for world in plus_doc for entry in world["children"])
    print(f"Ingredientsanity : {len(plain)} checks (flat list)")
    pin_total = sum(len(world["children"]) for world in plus_doc)
    print(f"Ingredientsanity+: {spot_total} checks across {pin_total} pins "
          f"in {len(plus_doc)} worlds "
          f"({len(clusters)} anchors, {len(clusters) - pin_total} merged as coincident)")
    if context["unresolved"]:
        print(f"WARNING: {len(context['unresolved'])} spot(s) had no usable anchor:")
        for ap_id, name, anchors in context["unresolved"][:10]:
            print(f"  {ap_id} {name} anchors={anchors}")

    if args.dry_run:
        return

    INGREDIENTS_FILE.write_text(
        json.dumps(ingredients_doc, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    INGREDIENTS_PLUS_FILE.write_text(
        json.dumps(plus_doc, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    # Scratch output: {ap_id: [pin, section]}, consumed when rebuilding
    # location_mapping.lua / location_names.json. Not part of the pack.
    (ROOT / "scripts" / "tools" / "_ingredient_pins.json").write_text(
        json.dumps({str(k): v for k, v in sorted(pins.items())}, indent=1, ensure_ascii=False),
        encoding="utf-8")
    print(f"-> {INGREDIENTS_FILE.relative_to(ROOT)}")
    print(f"-> {INGREDIENTS_PLUS_FILE.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
