#!/usr/bin/env python3
"""
Regenerate scripts/autotracking/location_mapping.lua from the KH3 Archipelago
apworld's extracted location data.

The AP world assigns each location a sequential ID:
    id = BASE_LOCATION_ID + index
where `index` is the location's plain position in the "locations" array of
the extracted data JSON (see Locations.py / Data.py in the apworld source).
One location is a fixed exception, assigned independently of that sequence:
    "Olympus - Rock Titan Sequence Break Bonus" = BASE_LOCATION_ID + 0xFFFF

This was verified against the currently committed location_mapping.lua:
  - BASE_LOCATION_ID + index reproduces every ID in the treasure-chest range
    exactly.
  - The gap between "Lucky Emblems - Milestone 1" (1263023258) and
    "Level Ups - Sora Level 2" (1263023276) is 18 -- exactly the number of
    Lucky Emblem milestone locations -- confirming no entries are skipped
    or filtered out of the index sequence (not even ones flagged
    "ap_enabled": false in the source data, e.g. Olympus - Victory Bonus 004).

Display names: treasure locations are renamed to "<World> - Chest <n> (<Size>, <Area>)", using
the in-game appearance number that leads their "location_description", not the
per-size numbering of their raw "name". Every other type (event,
vbonus, lucky_emblem, level_up, ...) uses "location_description" verbatim
when the source data has one, since their raw names are often opaque AP
identifiers (e.g. "Olympus - Victory Bonus 082"); otherwise it falls back
to the raw name. The AP id is always keyed off the raw name's position in
the source array, never the description, so this doesn't affect IDs.

NOTE: this only regenerates location_mapping.lua. Any location whose
display name changes (or is newly added) also needs a matching entry in
the relevant locations/*.json file and, for overworld locations,
autotracking.lua's OVERWORLD_SECTION_MAP -- otherwise its "code" is a
dangling pointer that autotracking silently fails to resolve (see
rename_location.py).

Usage:
    python scripts/tools/regenerate_location_mapping.py --data extracted_locations.json
    python scripts/tools/regenerate_location_mapping.py --data extracted_locations.json --dry-run
"""
import argparse
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
LOCATION_MAPPING_LUA = ROOT / "scripts" / "autotracking" / "location_mapping.lua"

BASE_LOCATION_ID = 0x4B483300
ROCK_TITAN_NO_WALL_RUN_BONUS_LOCATION_NAME = "Olympus - Rock Titan Sequence Break Bonus"
ROCK_TITAN_NO_WALL_RUN_BONUS_LOCATION_ID = BASE_LOCATION_ID + 0xFFFF


# "Chest 29 (Large Chest, Realm of the Gods: Corridors, Near Save Point)"
# -> number, size, area. Some rows have no trailing hint, and one closes its
# parenthesis early, so stop at the first comma or ")". Written without
# backslash escapes on purpose.
CHEST_DESCRIPTION_RE = re.compile("^Chest ([0-9]+) [(]([^,]+), ([^,)]+)")


def display_name_for(location: dict) -> str:
    """Tracker-side name for a location.

    Treasures are named by their in-game order of appearance, with the chest size
    and area kept as description -- "Olympus - Chest 29 (Large Chest, Realm of
    the Gods: Corridors)" -- which is how the community and the game itself refer to them. The
    apworld carries both schemes: the raw "name" numbers chests per size
    ("Olympus - Large Chest 1"), while "location_description" leads with the
    appearance number. The number is unique within a world, so prefixing with
    the world keeps tracker section names globally unique, which
    OVERWORLD_SECTION_MAP requires (it is keyed by section name alone).

    Falls back to the raw name if a description ever stops matching; one row
    already has a stray parenthesis ("Chest 6 (Small Chest, The City: North
    District), Northeast ..."), hence matching only the leading number.

    Every other type uses "location_description" verbatim, since their raw
    names are opaque AP identifiers (e.g. "Olympus - Victory Bonus 082").
    """
    if location.get("type") == "treasure":
        match = CHEST_DESCRIPTION_RE.match(location.get("location_description") or "")
        if match:
            number, size, area = match.groups()
            return f"{location['world']} - Chest {int(number)} ({size}, {area})"
        return location["name"]
    return location.get("location_description") or location["name"]


def build_records(data: dict) -> dict[int, str]:
    """Returns {ap_id: display_name}."""
    locations = data["locations"]
    names = [loc["name"] for loc in locations]
    if len(names) != len(set(names)):
        seen = set()
        dupes = sorted({n for n in names if (n in seen) or seen.add(n)})
        raise SystemExit(f"error: duplicate location names in source data: {dupes}")

    records = {
        BASE_LOCATION_ID + i: display_name_for(loc)
        for i, loc in enumerate(locations)
    }
    records[ROCK_TITAN_NO_WALL_RUN_BONUS_LOCATION_ID] = ROCK_TITAN_NO_WALL_RUN_BONUS_LOCATION_NAME

    display_names = list(records.values())
    if len(display_names) != len(set(display_names)):
        seen = set()
        dupes = sorted({n for n in display_names if (n in seen) or seen.add(n)})
        print("warning: multiple locations resolved to the same display name (likely a "
              "shared/generic location_description) -- their codes will collide in "
              f"location_mapping.lua: {dupes}")
    return records


def render_lua(records: dict[int, str]) -> str:
    lines = ["-- Auto-generated from KH3 Archipelago", "", "LOCATION_MAPPING = {"]
    for ap_id, name in sorted(records.items()):
        lines.append(f'    [{ap_id}] = {{ code = "@{name}/{name}" }},')
    lines.append("}")
    lines.append("")
    return "\n".join(lines)


def parse_existing(text: str) -> dict[int, str]:
    records = {}
    for line in text.splitlines():
        line = line.strip()
        if line.startswith("["):
            id_part, rest = line.split("]", 1)
            ap_id = int(id_part[1:])
            name = rest.split('"@', 1)[1].split("/", 1)[0]
            records[ap_id] = name
    return records


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--data", required=True, type=Path, help="Path to the extracted_locations.json source data")
    ap.add_argument("--dry-run", action="store_true", help="Print a diff summary without writing the file")
    args = ap.parse_args()

    data = json.loads(args.data.read_text(encoding="utf-8"))
    new_records = build_records(data)
    new_text = render_lua(new_records)

    old_text = LOCATION_MAPPING_LUA.read_text(encoding="utf-8") if LOCATION_MAPPING_LUA.exists() else ""
    old_records = parse_existing(old_text)

    added = sorted(set(new_records) - set(old_records))
    removed = sorted(set(old_records) - set(new_records))
    renamed = sorted(i for i in (set(new_records) & set(old_records)) if new_records[i] != old_records[i])

    print(f"New locations: {len(added)}")
    for i in added:
        print(f"  + [{i}] {new_records[i]}")
    print(f"Removed locations: {len(removed)}")
    for i in removed:
        print(f"  - [{i}] {old_records[i]}")
    print(f"Display name changes for existing ids: {len(renamed)}")
    for i in renamed:
        print(f"  ~ [{i}] {old_records[i]!r} -> {new_records[i]!r}")

    if args.dry_run:
        print("\nDry run: location_mapping.lua not written.")
        return

    LOCATION_MAPPING_LUA.write_text(new_text, encoding="utf-8")
    print(f"\nWrote {LOCATION_MAPPING_LUA.relative_to(ROOT)} ({len(new_records)} locations).")
    if added or removed or renamed:
        print("Remember: locations/*.json and autotracking.lua's OVERWORLD_SECTION_MAP")
        print("also need to be updated for any added/removed/renamed locations.")


if __name__ == "__main__":
    main()
