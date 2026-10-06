#!/usr/bin/env python3
"""
Make the pack's access rules agree with the KH3 apworld's logic.

The apworld (and so the Universal Tracker) is the reference. For every
location the tracker can show, this tool rebuilds the rule the apworld applies
-- world access (portal keyblade, tier gate, Twilight Town / Caribbean combat
gates, Coliseum completion), the LogicData item routes, location dependencies,
and the type-specific extras (Moogle Workshop, Coliseum cups, keyblade
upgrades...) -- as a set of alternative routes, then compares it with what the
tracker enforces for the matching section: its own access_rules ANDed with
every parent's.

It models Rules.py of the apworld (0.16.x layout). Run
check_logic_against_apworld.py afterwards: that one executes the apworld's real
Rules.py and is the judge.

Atoms
-----
A route is a set of atoms. An atom is an item code ("ability_block"), or an
opaque tracker function call ("$has_tier_one_keyblades",
"$can_complete_coliseum_worlds|Olympus"). $has_any / $has_at_least are expanded
into routes. `active_*` settings are ignored on both sides, and level-up /
Lucky Emblem sections are left alone (their rules are Lua counters).

How a section is matched
------------------------
AP location id = base + index in the finalized catalog (see
dump_apworld_catalog.py), and scripts/autotracking/location_mapping.lua maps
that id to the section name. A section can appear several times (mirrors in
other files); each occurrence is checked on its own.

Usage:
    python scripts/tools/sync_access_rules.py            # report differences
    python scripts/tools/sync_access_rules.py --apply    # rewrite locations/*.json
    python scripts/tools/sync_access_rules.py --apworld path/to/kh3.apworld

A section is only rewritten when its own rule can fix it. If a parent already
demands more than the apworld does, the section is reported as "manual" and
left alone.
"""
import argparse
import functools
import glob
import importlib
import itertools
import json
import re
import sys
import tempfile
from pathlib import Path

if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "scripts" / "tools"))
import dump_apworld_catalog as dump  # noqa: E402

# Granted before the first check (Archipelago hands it out), never a requirement.
ALWAYS_OWNED = {"Unlock: Airstep"}
# Catalog types whose rules the tracker spells out in access_rules. Level-ups,
# Lucky Emblems, the Moogle Shop... are gated by Lua counters instead.
RULE_TYPES = {"treasure", "event", "vbonus", "ingredient", "minigame_reward", "synthesis",
              "photo_mission", "keyblade_upgrade", "olympus_coliseum", "classic_kingdom"}
DEFENSIVE = ("ability_air_slide", "ability_block", "ability_dodge_roll")

TIER_ATOM = "$has_tier_one_keyblades"
# A world's portal: its keyblade, or its characters with Portal Unlocks = party members.
PORTAL_ATOM = "$portal"
# Chestsanity: the keyblade the seed assigned to a chest (by AP id), read from slot_data.
CHEST_KEYBLADE_ATOM = "$chest_keyblade"
TT_COMBAT_ATOM = "$has_twilight_town_combat"
CARIBBEAN_ATOM = "$has_caribbean_safety_tool"
FINAL_BOSS_ATOM = "$can_reach_final_boss"
ALL_CLASSIC_KINGDOM_ATOM = "$has_all_classic_kingdom_games"
KEYBLADE_UPGRADE_ATOM = "$keyblade_upgrade"
COMPLETE_ATOM = "$can_complete_coliseum_worlds"

TRUE = frozenset([frozenset()])


# Completing a world implies reaching it: "$can_complete_coliseum_worlds|A|B"
# carries the gates of A and B. Set by apworld_rules (needs the apworld's tables).
world_gate_atoms = lambda world: frozenset()


def implied(atom_name):
    if atom_name.startswith(COMPLETE_ATOM + "|"):
        return frozenset().union(*(world_gate_atoms(w) for w in atom_name.split("|")[1:]))
    return frozenset()


def closure(route):
    extra = frozenset().union(*(implied(a) for a in route)) if route else frozenset()
    return route | extra


# --- boolean helpers: a rule is a frozenset of routes, a route a frozenset of atoms ---
def minimize(routes):
    kept = []
    for route in sorted({closure(r) for r in routes}, key=len):
        if not any(k <= route for k in kept):
            kept.append(route)
    return frozenset(kept)


def AND(a, b):
    return minimize(x | y for x in a for y in b)


def OR(a, b):
    return minimize(set(a) | set(b))


def atom(name):
    return frozenset([frozenset([name])])


# --- tracker tokens -> routes ---
def token_rule(token):
    token = token.strip()
    if not token or token.startswith("active_") or token.startswith("["):
        return TRUE
    if token.startswith("$"):
        parts = token[1:].split("|")
        if parts[0] == "has_any":
            return minimize(frozenset([c]) for c in parts[1:])
        if parts[0] == "any_portal":
            return minimize(frozenset([f"{PORTAL_ATOM}|{c}"]) for c in parts[1:])
        if parts[0] == "has_at_least":
            return minimize(frozenset(c) for c in itertools.combinations(parts[2:], int(parts[1])))
        return atom(token)
    code, _, count = token.partition(":")
    return atom(code if count in ("", "1") else token)


def rules_to_dnf(rules):
    """OR over the strings of one access_rules list; ANDed tokens inside each."""
    if not rules:
        return TRUE
    result = frozenset()
    for rule in rules:
        route = TRUE
        for token in rule.split(","):
            route = AND(route, token_rule(token))
        result = OR(result, route)
    return result


# --- rendering routes back into access_rules strings ---
def render(dnf):
    """Compact rule strings; has_any / has_at_least recover the authored style."""
    routes = [set(r) - frozenset().union(*(implied(a) for a in r)) for r in dnf]
    by_rest = {}
    for r in routes:
        by_rest.setdefault(frozenset(r - set(DEFENSIVE)), []).append(frozenset(r & set(DEFENSIVE)))
    merged = []
    for rest, extras in by_rest.items():
        for k in (2, 1):
            combos = {frozenset(c) for c in itertools.combinations(DEFENSIVE, k)}
            if combos <= set(extras):
                merged.append(set(rest) | {f"$has_at_least|{k}|" + "|".join(DEFENSIVE)})
                extras = [e for e in extras if e not in combos]
                break
        for e in extras:
            merged.append(set(rest) | set(e))
    routes = merged
    while True:
        buckets = {}
        for i, r in enumerate(routes):
            for x in r:
                if not x.startswith("$"):
                    buckets.setdefault(frozenset(r - {x}), set()).add((x, i))
        best = max(((k, v) for k, v in buckets.items() if len({x for x, _ in v}) > 1),
                   key=lambda kv: len(kv[1]), default=None)
        if best is None:
            break
        rest, members = best
        used = {i for _, i in members}
        routes = [r for i, r in enumerate(routes) if i not in used]
        routes.append(set(rest) | {"$has_any|" + "|".join(sorted({x for x, _ in members}))})
    return sorted(",".join(sorted(r, key=lambda t: (t.startswith("$"), t))) for r in routes)


def show(dnf):
    return " OR ".join("{" + "+".join(sorted(r)) + "}" for r in sorted(dnf, key=lambda r: (len(r), sorted(r)))) or "TRUE"


# --- apworld side ---
def load_apworld(apworld):
    workdir = Path(tempfile.mkdtemp(prefix="kh3-apworld-"))
    package = dump._stage_package(apworld, workdir)
    dump._install_baseclasses_stub()
    sys.path.insert(0, str(workdir))
    try:
        mods = {name: importlib.import_module(f"{package}.{name}")
                for name in ("Data", "LogicData", "Logic", "ColiseumLogic", "Ingredients", "Regions")}
        mods["catalog"] = mods["Data"].load_extracted_data()["locations"]
    finally:
        sys.path.remove(str(workdir))
    return mods


def apworld_rules(apworld):
    m = load_apworld(apworld)
    data, logic_data, logic = m["Data"], m["LogicData"], m["Logic"]
    coliseum, ingredients, regions, catalog = m["ColiseumLogic"], m["Ingredients"], m["Regions"], m["catalog"]

    item_mapping = (ROOT / "scripts/autotracking/item_mapping.lua").read_text(encoding="utf-8")
    name_to_code = dict(re.findall(r'\["([^"]+)"\]\s*=\s*\{\s*code\s*=\s*"([^"]+)"', item_mapping))

    def code(name):
        if name not in name_to_code:
            raise SystemExit(f"error: apworld item {name!r} has no code in item_mapping.lua")
        return name_to_code[name]

    def route_rule(route):
        rule = TRUE
        for clause in route:
            if isinstance(clause, logic.CountedRequirement):
                options = [frozenset(code(n) for n in combo if n not in ALWAYS_OWNED)
                           for combo in itertools.combinations(sorted(clause.item_names), clause.count)]
            else:
                if any(n in ALWAYS_OWNED for n in clause):
                    continue
                options = [frozenset([code(n)]) for n in clause]
            rule = AND(rule, minimize(options))
        return rule

    def alternatives(routes):
        rule = frozenset()
        for route in routes:
            rule = OR(rule, route_rule(route))
        return rule

    reqs = {}
    for table in ("CHEST_LOGIC_REQUIREMENTS", "VICTORY_BONUS_LOGIC_REQUIREMENTS",
                  "EVENT_LOGIC_REQUIREMENTS", "INGREDIENT_LOGIC_REQUIREMENTS"):
        reqs.update(getattr(logic_data, table))
    deps = logic_data.LOCATION_LOGIC_DEPENDENCIES
    portal = data.PORTAL_KEYBLADE_REGION_LOCKS
    tiers = data.WORLD_DIFFICULTY_TIER_BY_REGION
    battlegate_lock = data.CURRENTLY_WORKING_BATTLEGATE_SOURCE_ID_REGION_LOCKS
    shared_name = regions.KEYBLADE_GRAVEYARD_REMIND_SHARED_REGION_NAME
    shared_keys = regions.KEYBLADE_GRAVEYARD_REMIND_SHARED_SOURCE_KEYS
    all_worlds = tuple(coliseum.COLISEUM_WORLD_COMPLETION_SOURCES)
    complete_all = atom(COMPLETE_ATOM + "|" + "|".join(all_worlds))

    @functools.lru_cache(None)
    def gate(region):
        """What the hub entrance to `region` demands (Rules.py, hub.exits loop)."""
        if region == shared_name:
            return OR(gate("Keyblade Graveyard"), gate("Re Mind"))
        rule = TRUE
        if region in portal:
            rule = AND(rule, atom(f"{PORTAL_ATOM}|{code(portal[region])}"))
        if region not in {"Twilight Town", "Unreality"} and tiers.get(region, 1) > 1:
            rule = AND(rule, atom(TIER_ATOM))
        if region == "Twilight Town":
            rule = AND(rule, atom(TT_COMBAT_ATOM))
        if region == "The Caribbean":
            rule = AND(rule, atom(CARIBBEAN_ATOM))
        if region == "Olympus Coliseum":
            rule = AND(rule, atom(f"{COMPLETE_ATOM}|Olympus"))
        return rule

    global world_gate_atoms
    world_gate_atoms = lambda world: frozenset().union(*gate(world)) if len(gate(world)) == 1 else frozenset()

    index_by_key = {(r["source_table"], str(r["source_id"])): i for i, r in enumerate(catalog)}

    @functools.lru_cache(None)
    def full(key):
        row = catalog[index_by_key[key]]
        kind = row.get("type")
        region = row["world"]
        if key == ("VBonus", "Vbonus_082"):
            region = None  # the opening Darkside precedes the hub
        elif key in shared_keys:
            region = shared_name
        rule = gate(region) if region else TRUE

        if row["source_table"] == "IngredientSpot":
            rule = AND(rule, gate(ingredients.INGREDIENT_SPOTS_BY_ID[row["source_id"]]["world"]))
        if kind in ("synthesis", "photo_mission"):
            rule = AND(rule, complete_all)
            if kind == "photo_mission" or row.get("synthesis_order", 0) > 15:
                rule = AND(rule, atom(FINAL_BOSS_ATOM))
        if kind == "treasure":
            # Rules.location_rule adds Has(<assigned keyblade>) to the chest itself, so the
            # checks that depend on it inherit the requirement too.
            rule = AND(rule, atom(f"{CHEST_KEYBLADE_ATOM}|{dump.BASE_LOCATION_ID + index_by_key[key]}"))
        if kind == "keyblade_upgrade":
            # The keyblade plus, depending on the Keyblade Levels option, enough level items:
            # the tracker's $keyblade_upgrade function covers all three modes.
            rule = AND(rule, atom(f"{KEYBLADE_UPGRADE_ATOM}|{code(row['keyblade_name'])}|{row['keyblade_level']}"))
        lock = battlegate_lock.get(row["source_id"])
        if lock is not None:
            rule = AND(rule, gate(lock))
        if row["source_table"] == "OlympusColiseumCup":
            cup = row["source_id"]
            worlds = coliseum.COLISEUM_CUP_REQUIRED_WORLDS[cup]
            if worlds:
                rule = AND(rule, atom(COMPLETE_ATOM + "|" + "|".join(worlds)))
            if cup in coliseum.COLISEUM_POSTGAME_CUP_IDS:
                rule = AND(rule, atom(FINAL_BOSS_ATOM))
        if row.get("classic_kingdom_check_kind") or row.get("source_id") == data.CLASSIC_KINGDOM_ALL_GAMES_SOURCE_ID:
            if row.get("source_id") == data.CLASSIC_KINGDOM_ALL_GAMES_SOURCE_ID:
                rule = AND(rule, atom(ALL_CLASSIC_KINGDOM_ATOM))
            else:
                unlock = data.CLASSIC_KINGDOM_UNLOCK_ITEM_NAMES_BY_GAME_ID.get(str(row.get("source_id") or ""))
                if unlock is not None:
                    rule = AND(rule, atom(code(unlock)))
        if key in reqs:
            rule = AND(rule, alternatives(reqs[key]))
        dep = deps.get(key)
        if dep is not None:
            parts = [full(k) for k in dep.source_keys]
            if dep.require_all:
                for part in parts:
                    rule = AND(rule, part)
            else:
                any_part = frozenset()
                for part in parts:
                    any_part = OR(any_part, part)
                rule = AND(rule, any_part)
        return rule

    mapping = (ROOT / "scripts/autotracking/location_mapping.lua").read_text(encoding="utf-8")
    id_to_section = {int(i): c.split("/", 1)[1]
                     for i, c in re.findall(r'\[(\d+)\]\s*=\s*\{\s*code\s*=\s*"([^"]+)"', mapping)}
    result = {}
    for key, index in index_by_key.items():
        if catalog[index]["type"] not in RULE_TYPES:
            continue
        section = id_to_section.get(dump.BASE_LOCATION_ID + index)
        if section is not None:
            result[section] = full(key)
    return result


# --- tracker side ---
def collect_occurrences():
    occurrences, registry = {}, {}

    def walk(node, chain, path):
        if "parent" in node and not chain:
            chain = registry.get(node["parent"], [])
        here = chain + [node]
        registry[node["name"]] = here
        for section in node.get("sections", []) or []:
            occurrences.setdefault(section["name"], []).append({
                "file": path, "section": section, "chain": here,
                "parents": parent_rule(here), "node": node,
            })
        for child in node.get("children", []) or []:
            walk(child, here, path)

    def parent_rule(chain):
        rule = TRUE
        for node in chain:
            rule = AND(rule, rules_to_dnf(node.get("access_rules")))
        return rule

    docs = {}
    order = re.findall(r'AddLocations\("locations/([^"]+)"\)',
                       (ROOT / "scripts" / "locations.lua").read_text(encoding="utf-8"))
    for name in order:
        path = str(ROOT / "locations" / name)
        with open(path, encoding="utf-8", newline="") as handle:
            raw = handle.read()
        docs[path] = (json.loads(raw), "\r\n" if "\r\n" in raw else "\n", raw.endswith("\n"))
        for node in docs[path][0]:
            if name != "overworld.json":  # mirrors only
                walk(node, [], path)
    return occurrences, docs


def implies(a, b):
    """Every route of a satisfies b."""
    return all(any(r <= route for r in b) for route in a)


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--apworld", type=Path, default=ROOT / "kh3.apworld")
    parser.add_argument("--apply", action="store_true", help="rewrite the section rules that differ")
    args = parser.parse_args()

    expected = apworld_rules(args.apworld)
    occurrences, docs = collect_occurrences()

    equal = 0
    fixes, manual = [], []
    for name, target in expected.items():
        for occ in occurrences.get(name, []):
            section = occ["section"]
            current = AND(occ["parents"], rules_to_dnf(section.get("access_rules")))
            if current == target:
                equal += 1
            elif implies(target, occ["parents"]):
                fixes.append((name, occ, target, current))
            else:
                manual.append((name, occ, target, current))

    print(f"{equal} occurrences already match | {len(fixes)} fixable | {len(manual)} need a parent change")
    for name, occ, target, current in fixes:
        print(f"  fix  {name} [{Path(occ['file']).name}]\n       was {show(current)[:200]}\n       now {show(target)[:200]}")
    # A parent that only exists to carry a rule for sections that all need the same
    # (different) rule can take the apworld's rule itself.
    by_node = {}
    for name, occ, target, current in manual:
        by_node.setdefault(id(occ["node"]), []).append((name, occ, target))
    parent_fixes = []
    for group in by_node.values():
        node = group[0][1]["node"]
        sections = node.get("sections", []) or []
        targets = {t for _, _, t in group}
        if len(group) == len(sections) and len(targets) == 1 and not node.get("children"):
            parent_fixes.append((node, group))
    handled = {id(occ["section"]) for _, group in parent_fixes for _, occ, _ in group}
    for node, group in parent_fixes:
        print(f"  fix  parent {node['name']} [{Path(group[0][1]['file']).name}] -> "
              f"{show(group[0][2])[:160]}  (for {', '.join(n for n, _, _ in group)})")
    for name, occ, target, current in manual:
        if id(occ["section"]) not in handled:
            print(f"  MANUAL {name} [{Path(occ['file']).name}]"
                  f"\n       parents {show(occ['parents'])[:200]}\n       apworld {show(target)[:200]}")

    if not args.apply:
        return

    def set_rules(node, target, inherited):
        # Keep the node's `active_*` settings. A single-route inherited gate is already
        # enforced by the parents, so its atoms are not repeated on the section.
        old = node.get("access_rules") or []
        settings = sorted({t.strip() for rule in old for t in rule.split(",") if t.strip().startswith("active_")})
        already = next(iter(inherited)) if len(inherited) == 1 else frozenset()
        reduced = minimize(r - already for r in target)
        routes = render(reduced) if reduced != TRUE else []
        if settings:
            routes = [",".join(settings + ([r] if r else [])) for r in (routes or [""])]
        if routes:
            node["access_rules"] = routes
        else:
            node.pop("access_rules", None)

    for name, occ, target, _ in fixes:
        set_rules(occ["section"], target, occ["parents"])
    for node, group in parent_fixes:
        above = TRUE
        for ancestor in group[0][1]["chain"]:
            if ancestor is node:
                break
            above = AND(above, rules_to_dnf(ancestor.get("access_rules")))
        set_rules(node, group[0][2], above)
    touched = {occ["file"] for _, occ, _, _ in fixes}
    touched |= {group[0][1]["file"] for _, group in parent_fixes}
    for path in touched:
        doc, newline, final_newline = docs[path]
        text = json.dumps(doc, indent=2, ensure_ascii=False).replace("\n", newline)
        with open(path, "w", encoding="utf-8", newline="") as handle:
            handle.write(text + (newline if final_newline else ""))
    print(f"rewrote {len(touched)} file(s)")


if __name__ == "__main__":
    main()
