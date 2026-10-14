#!/usr/bin/env python3
"""
Generate the Gummi space checks of the tracker from the apworld dump.

Inputs : scripts/tools/extracted_locations.json  (dump_apworld_catalog.py output,
                                                   key "space_locations")
         scripts/tools/space_points.py           (pin coordinates per map)
Outputs (all idempotent -- re-running replaces what a previous run wrote):
  - locations/space.json                 detailed locations, one pin per battle / sphere
  - locations/overworld.json             one "All Checks" mirror per galaxy + missions
  - scripts/tools/location_names.json    "groups" entries (display pin <- raw AP name)
  - scripts/autotracking/autotracking.lua  OVERWORLD_SECTION_MAP block between markers
  - scripts/autotracking/item_mapping.lua  Gummi blueprints / special weapons block between markers

Access rules mirror Space.set_space_rules of the apworld: a zone needs its
travel blueprint (ZONE_UNLOCK_BLUEPRINTS) and 1 / 2 / 3 completed main worlds
(WORLD_COMPLETIONS_BY_ZONE), global missions need any open zone, Schwarzgeist
and the Completionist need Endymion, Special Weapon missions count weapons
(+ Twilight Town arrival and the Monstropolis finale), Treasure Hunter missions
count open zones. Visibility rules follow Space.space_locations: grindy
missions need active_space_grindy, superboss rewards active_space_superbosses, the
Completionist both.

Run order:  dump_apworld_catalog.py -> generate_space_locations.py -> sync_location_names.py

Display names:
  gazer   "Space - <Zone> - <Ship> Gazer"          (green marker on the map)
  battle  "Space - <Zone> - <letter> (<fight>)"   section = raw AP name
  sphere  "Space - <Zone> - Treasure Sphere <greek>"
  zone    "Space - <Zone> - Missions"              (its Builder commendation, no map pin)
  mission "Space - Missions"                       (global missions, no map pin)
The letter is the red-heart marker printed on the in-game map.
"""
import json
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from space_points import MAPS  # noqa: E402

ROOT = Path(__file__).resolve().parents[2]
DUMP = ROOT / "scripts/tools/extracted_locations.json"
NAMES = ROOT / "scripts/tools/location_names.json"
OVERWORLD = ROOT / "locations/overworld.json"
SPACE_JSON = ROOT / "locations/space.json"
AUTOTRACKING = ROOT / "scripts/autotracking/autotracking.lua"
ITEM_MAPPING = ROOT / "scripts/autotracking/item_mapping.lua"
ENDYMION = "Gummi Blueprint: Endymion"

GREEK = "αβγδεζηθι"
# Pins on the Overworld map, around the Gummi ship logo (top-left corner).
OVERWORLD_PINS = {
    "Starlight Way": (24, 94),
    "Misty Stream": (56, 102),
    "The Eclipse": (88, 94),
    "Missions": (104, 52),
}
ZONE_CODES = {"Starlight Way": "space_starlight_way", "Misty Stream": "space_misty_stream",
              "The Eclipse": "space_eclipse"}
ANY_SHIP = "$space_open_zones|1"
# Space.space_locations: checks that only exist with Include Grindy Space Missions /
# Include Space Superbosses; the Completionist (mission 45) needs both options.
GRINDY_MISSION_IDS = {20, 21, 22, 27, 33, 34, 35}
SUPERBOSS_MISSION_IDS = {13, 17}
COMPLETIONIST = 45
ITEM_BEGIN = "    -- BEGIN generated: gummi space items (scripts/tools/generate_space_locations.py)"
ITEM_END = "    -- END generated: gummi space items"
BEGIN = "    -- BEGIN generated: gummi space (scripts/tools/generate_space_locations.py)"
END = "    -- END generated: gummi space"


def read_text(path):
    return path.read_bytes().decode("utf-8").replace("\r\n", "\n")


def write_text(path, text, like=None):
    """Write LF text, switching to CRLF when the file (or `like`) already uses it."""
    ref = like or path
    crlf = ref.exists() and b"\r\n" in ref.read_bytes()
    path.write_bytes((text.replace("\n", "\r\n") if crlf else text).encode("utf-8"))


def parent_name(zone):
    return f"Gummi Space - {zone}"


def mirror_name(zone):
    return f"Gummi Space - {zone} - All Checks"


def build():
    dump = json.loads(read_text(DUMP))
    rows = dump["space_locations"]
    zones = {}  # zone -> (map name, [pin dict]); a pin's sections are (ap_id, name, row)

    def sec(r):
        return (r["ap_id"], r["name"], r)

    for m in MAPS.values():
        zone = m["zone"]
        zrows = [r for r in rows if r["space_zone"] == zone]
        battle_ids = sorted({r["battle_id"] for r in zrows if r["battle_id"]})
        letters = list(m["battles"])
        assert len(battle_ids) == len(letters) == len(m["names"]), (zone, len(battle_ids), len(letters))
        expected = [f"gm_{m['area']:02}_Battle_{n:02}" for n in m["battle_ids"]]
        assert battle_ids == expected, (zone, battle_ids, expected)
        pins = []
        for bid, letter, fight in zip(battle_ids, letters, m["names"]):
            x, y = m["battles"][letter]
            members = sorted((r for r in zrows if r["battle_id"] == bid), key=lambda r: r["ap_id"])
            pins.append(dict(location=f"Space - {zone} - {letter} ({fight})", x=x, y=y, shape=None,
                             sections=[sec(r) for r in members]))
        spheres = sorted((r for r in zrows if r["sphere_id"] is not None), key=lambda r: r["sphere_id"])
        sphere_letters = list(m["spheres"])
        assert len(spheres) == len(sphere_letters) == 3, zone
        for r, greek in zip(spheres, sphere_letters):
            assert greek == GREEK[r["sphere_id"]], (zone, greek, r["sphere_id"])
            x, y = m["spheres"][greek]
            pins.append(dict(location=f"Space - {zone} - Treasure Sphere {greek}", x=x, y=y,
                             shape="diamond", sections=[sec(r)]))
        zone_missions = {r["name"]: r for r in zrows if r["mission_id"] is not None}
        assert len(m["gazers"]) == 3, zone
        for who, (x, y) in m["gazers"].items():
            r = zone_missions.pop(f"Space - {who} Gazer")
            pins.append(dict(location=f"Space - {zone} - {who} Gazer", x=x, y=y, shape="diamond",
                             sections=[sec(r)]))
        # The zone's Builder commendation counts fragments found in that zone: it
        # needs the zone but has no spot of its own, so it gets a pin-less location.
        if zone_missions:
            pins.append(dict(location=f"Space - {zone} - Missions", x=None, y=None, shape=None,
                             sections=[sec(r) for r in sorted(zone_missions.values(),
                                                              key=lambda r: r["ap_id"])]))
        zones[zone] = (m["map"], pins)

    missions = [sec(r) for r in sorted((r for r in rows if r["mission_id"] is not None
                                        and r["space_zone"] is None), key=lambda r: r["ap_id"])]
    return zones, missions, dump["space_items"]


def update_names(zones, missions):
    data = json.loads(read_text(NAMES))
    groups = {k: v for k, v in data["groups"].items() if not k.startswith("Space - ")}
    for _, pins in zones.values():
        for pin in pins:
            groups[pin["location"]] = {str(i): n for i, n, _ in pin["sections"]}
    groups["Space - Missions"] = {str(i): n for i, n, _ in missions}
    data["groups"] = groups
    write_text(NAMES, json.dumps(data, indent=2, ensure_ascii=False) + "\n")


def zones_at_least(n):
    return f"$space_open_zones|{n}"


def section(name, rules=(), visibility=()):
    out = {"name": name, "item_count": 1}
    if rules:
        out["access_rules"] = list(rules)
    if visibility:
        out["visibility_rules"] = list(visibility)
    return out


def section_visibility(row):
    """Settings a check needs to exist in the seed, from Space.space_locations."""
    mid = row.get("mission_id")
    if mid == COMPLETIONIST:
        return ["active_space_grindy,active_space_superbosses"]
    if mid in GRINDY_MISSION_IDS:
        return ["active_space_grindy"]
    if row.get("boss_mission") in SUPERBOSS_MISSION_IDS:
        return ["active_space_superbosses"]
    return []


def section_rules(row, weapon_count):
    """Extra access rules of one check, from Space.set_space_rules."""
    mid = row.get("mission_id")
    rules = []
    if row.get("boss_mission") == 13 or mid == 45:
        rules.append("gummi_endymion")
    if mid in range(23, 28) or mid == 45:
        rules.append(f"$space_special_weapons|{weapon_count + 2 if mid == 45 else row['threshold']}")
    if mid == 45:
        rules.append("$space_all_worlds")
        rules.append(zones_at_least(len(ZONE_CODES)))
    if mid in range(28, 33):
        rules.append(zones_at_least((row["threshold"] + 2) // 3))
    return [",".join(rules)] if rules else []


def write_space_json(zones, missions, weapon_count):
    def sections(secs):
        return [section(n, section_rules(r, weapon_count), section_visibility(r)) for _, n, r in secs]

    out = []
    for zone, (map_name, pins) in zones.items():
        children = []
        for pin in pins:
            mls = []
            if pin["x"] is not None:
                ml = {"map": map_name, "x": pin["x"], "y": pin["y"]}
                if pin["shape"]:
                    ml["shape"] = pin["shape"]
                mls.append(ml)
            children.append({"name": pin["location"], "sections": sections(pin["sections"]),
                             "map_locations": mls})
        out.append({"name": parent_name(zone), "visibility_rules": ["active_space"],
                    "access_rules": [f"active_space,$space_zone_open|{ZONE_CODES[zone]}"],
                    "children": [{"name": "Checks", "children": children}]})
    out.append({"name": parent_name("Missions"), "visibility_rules": ["active_space"],
                "access_rules": [f"active_space,{ANY_SHIP}"],
                "children": [{"name": "Checks", "children": [
                    {"name": "Space - Missions", "sections": sections(missions),
                     "map_locations": []}]}]})
    write_text(SPACE_JSON, json.dumps(out, indent=2, ensure_ascii=False) + "\n", like=OVERWORLD)


def update_overworld(zones, missions):
    ow = json.loads(read_text(OVERWORLD))
    kids = ow[0]["children"][0]["children"]
    kids[:] = [k for k in kids if not k["name"].startswith("Gummi Space - ")]
    mirrors = {}
    for zone, (_, pins) in zones.items():
        mirrors[zone] = [{"name": n, "ref": f"{parent_name(zone)}/Checks/{pin['location']}/{n}"}
                         for pin in pins for _, n, _ in pin["sections"]]
    mirrors["Missions"] = [{"name": n, "ref": f"{parent_name('Missions')}/Checks/Space - Missions/{n}"}
                           for _, n, _ in missions]
    for zone, secs in mirrors.items():
        x, y = OVERWORLD_PINS[zone]
        ml = {"map": "map_overworld", "x": x, "y": y}
        if zone == "Missions":
            ml["shape"] = "diamond"
        access = ANY_SHIP if zone == "Missions" else f"$space_zone_open|{ZONE_CODES[zone]}"
        kids.append({"name": mirror_name(zone), "sections": secs, "map_locations": [ml],
                     "visibility_rules": ["active_space"], "access_rules": [f"active_space,{access}"]})
    write_text(OVERWORLD, json.dumps(ow, indent=2, ensure_ascii=False) + "\n")
    return mirrors


def replace_block(path, begin, end, lines, anchor):
    """Swap the generated block between markers, inserting it after `anchor` the first time."""
    block = "\n".join([begin, *lines, end]) + "\n"
    text = read_text(path)
    pattern = re.compile(re.escape(begin) + r".*?" + re.escape(end) + r"\n", re.S)
    if pattern.search(text):
        text = pattern.sub(lambda _: block, text, count=1)
    else:
        head, sep, rest = text.partition(anchor)
        assert sep, f"{anchor.strip()!r} not found in {path.name}"
        text = head + sep + block + rest
    write_text(path, text)


def update_autotracking(mirrors):
    lines = [f'    ["{s["name"]}"] = "@{mirror_name(zone)}/{s["name"]}",'
             for zone, secs in mirrors.items() for s in secs]
    replace_block(AUTOTRACKING, BEGIN, END, lines, "OVERWORLD_SECTION_MAP = {\n")


def update_item_mapping(items):
    """Zone blueprints feed their zone's counter, Endymion its own toggle (Schwarzgeist); special
    weapons one counter. The other blueprints open nothing (Space.ZONE_UNLOCK_BLUEPRINTS) and stay unmapped."""
    lines = []
    for it in items:
        if it["category"] == "Blueprint" and it["zone"]:
            lines.append(f'    ["{it["name"]}"] = {{ code = "{ZONE_CODES[it["zone"]]}", type = "consumable" }},')
        elif it["name"] == ENDYMION:
            lines.append(f'    ["{it["name"]}"] = {{ code = "gummi_endymion", type = "toggle" }},')
        elif it["category"] == "Special Weapon":
            lines.append(f'    ["{it["name"]}"] = {{ code = "space_special_weapon", type = "consumable" }},')
    replace_block(ITEM_MAPPING, ITEM_BEGIN, ITEM_END, lines, "ITEM_MAPPING_BY_NAME = {\n")
    return sum(it["category"] == "Special Weapon" for it in items)


def main():
    zones, missions, items = build()
    weapons = update_item_mapping(items)
    update_names(zones, missions)
    write_space_json(zones, missions, weapons)
    mirrors = update_overworld(zones, missions)
    update_autotracking(mirrors)
    n_pins = sum(len(p) for _, p in zones.values())
    n_sec = sum(len(pin["sections"]) for _, p in zones.values() for pin in p) + len(missions)
    print(f"{n_pins} map pins, {n_sec} sections ({len(missions)} global missions), "
          f"{sum(it['category'] == 'Blueprint' for it in items)} blueprints, {weapons} special weapons")


if __name__ == "__main__":
    main()
