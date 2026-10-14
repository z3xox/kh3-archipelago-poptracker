#!/usr/bin/env python3
"""
Generate the Adversary Checks of the tracker (apworld option adversary_checks).

Each eligible enemy type is one check, for its first defeat. Enemies have no
fixed spot, so there is no pin on the world maps; the Overworld carries them
instead:
  - one "Adversaries - First Defeats" pin at the centre of the Overworld circle,
    holding every check;
  - one diamond per world, inside the circle facing that world's icon, mirroring
    the enemies that world has. It lights up with the world, so it tells where an
    enemy can be fought right now.

Access rules follow Rules.location_rule: a check needs any world the enemy
appears in (Adversaries.ADVERSARY_WORLDS, Scala ad Caelum counted as Re Mind).
Sorcerer also needs EVENT_KEYBLADE_002, which asks nothing past Twilight Town.

Inputs : scripts/tools/extracted_locations.json  (dump_apworld_catalog.py output)
         kh3.apworld                             (data/adversary_journal.json)
Outputs (idempotent -- re-running replaces what a previous run wrote):
  - locations/adversaries.json
  - scripts/tools/location_names.json    "groups" entry (display pin <- raw AP name)
  - scripts/autotracking/autotracking.lua  OVERWORLD_SECTION_MAP block between markers

Run order:  dump_apworld_catalog.py -> generate_adversary_locations.py -> sync_location_names.py
"""
import json
import re
import sys
import zipfile
from pathlib import Path

if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")

ROOT = Path(__file__).resolve().parents[2]
APWORLD = ROOT / "kh3.apworld"
DUMP = ROOT / "scripts/tools/extracted_locations.json"
NAMES = ROOT / "scripts/tools/location_names.json"
ADVERSARIES_JSON = ROOT / "locations/adversaries.json"
LIKE = ROOT / "locations/overworld.json"
AUTOTRACKING = ROOT / "scripts/autotracking/autotracking.lua"
JOURNAL_RESOURCE = "kh3/data/adversary_journal.json"
BEGIN = "    -- BEGIN generated: adversaries (scripts/tools/generate_adversary_locations.py)"
END = "    -- END generated: adversaries"

MAIN_PIN = "Adversaries - First Defeats"
# Overworld map: the circle's centre, and each world's "All Checks" pin. A world's
# diamond sits 40% of the way from that pin to the centre: inside the circle,
# clear of the world icon.
CENTRE = (309, 300)
WORLD_PINS = {
    "Olympus": (114, 190), "Twilight Town": (430, 460), "Toy Box": (187, 467),
    "Kingdom of Corona": (528, 261), "Monstropolis": (502, 408), "Arendelle": (79, 265),
    "The Caribbean": (493, 186), "San Fransokyo": (126, 421), "Keyblade Graveyard": (430, 127),
    "Re Mind": (174, 119),
}
TOWARD_CENTRE = 0.4


def read_text(path):
    return path.read_bytes().decode("utf-8").replace("\r\n", "\n")


def write_text(path, text, like=None):
    """Write LF text, switching to CRLF when the file (or `like`) already uses it."""
    ref = path if path.exists() else (like or path)
    crlf = ref.exists() and b"\r\n" in ref.read_bytes()
    path.write_bytes((text.replace("\n", "\r\n") if crlf else text).encode("utf-8"))


def world_pin(world):
    (x, y), (cx, cy) = WORLD_PINS[world], CENTRE
    return round(x + (cx - x) * TOWARD_CENTRE), round(y + (cy - y) * TOWARD_CENTRE)


def build():
    dump = json.loads(read_text(DUMP))
    base = dump["meta"]["base_location_id"]
    with zipfile.ZipFile(APWORLD) as archive:
        journal = json.loads(archive.read(JOURNAL_RESOURCE).decode("utf-8"))["enemies"]
    worlds_by_id = {
        entry["id"]: sorted({"Re Mind" if s["world"] == "Scala ad Caelum" else s["world"]
                             for s in entry["sources"]})
        for entry in journal
    }
    checks = []
    for index, row in enumerate(dump["locations"]):
        if row.get("type") != "adversary":
            continue
        worlds = worlds_by_id[row["source_id"]]
        unknown = set(worlds) - set(WORLD_PINS)
        if unknown:
            raise SystemExit(f"error: {row['name']} appears in worlds without an Overworld pin: {unknown}")
        checks.append((base + index, row["name"], worlds))
    return checks


def write_locations(checks):
    by_world = {world: [] for world in WORLD_PINS}
    for _ap_id, name, worlds in checks:
        for world in worlds:
            by_world[world].append(name)
    children = [{
        "name": MAIN_PIN,
        "sections": [{"name": name, "item_count": 1,
                      "access_rules": ["$can_reach_any_world|" + "|".join(worlds)]}
                     for _ap_id, name, worlds in checks],
        "map_locations": [{"map": "map_overworld", "x": CENTRE[0], "y": CENTRE[1]}],
    }]
    for world, names in by_world.items():
        if not names:
            continue
        x, y = world_pin(world)
        children.append({
            "name": f"Adversaries - {world}",
            "access_rules": [f"$can_reach_any_world|{world}"],
            "sections": [{"name": name, "ref": f"Adversaries/{MAIN_PIN}/{name}"} for name in names],
            "map_locations": [{"map": "map_overworld", "x": x, "y": y, "shape": "diamond"}],
        })
    # The pool gate has to hide, not just grey out: with the option off these
    # checks are not in the seed at all (Data.filter_locations_for_options).
    doc = [{
        "name": "Adversaries",
        "access_rules": ["active_adversaries"],
        "visibility_rules": ["active_adversaries"],
        "children": children,
    }]
    write_text(ADVERSARIES_JSON, json.dumps(doc, indent=2, ensure_ascii=False) + "\n", like=LIKE)
    return by_world


def update_names(checks):
    data = json.loads(read_text(NAMES))
    data["groups"][MAIN_PIN] = {str(ap_id): name for ap_id, name, _worlds in checks}
    write_text(NAMES, json.dumps(data, indent=2, ensure_ascii=False) + "\n")


def update_autotracking(checks):
    lines = []
    for _ap_id, name, worlds in checks:
        codes = ", ".join(f'"@Adversaries - {world}/{name}"' for world in worlds)
        lines.append(f'    ["{name}"] = {{{codes}}},')
    block = "\n".join([BEGIN, *lines, END]) + "\n"
    text = read_text(AUTOTRACKING)
    pattern = re.compile(re.escape(BEGIN) + r".*?" + re.escape(END) + r"\n", re.S)
    if pattern.search(text):
        text = pattern.sub(lambda _: block, text, count=1)
    else:
        anchor = "OVERWORLD_SECTION_MAP = {\n"
        head, sep, rest = text.partition(anchor)
        assert sep, f"{anchor.strip()!r} not found in {AUTOTRACKING.name}"
        text = head + sep + block + rest
    write_text(AUTOTRACKING, text)


def main():
    checks = build()
    by_world = write_locations(checks)
    update_names(checks)
    update_autotracking(checks)
    print(f"{len(checks)} adversary checks; world pins: "
          + ", ".join(f"{w} {len(n)}" for w, n in by_world.items() if n))


if __name__ == "__main__":
    main()
