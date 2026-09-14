#!/usr/bin/env python3
"""
Single entry point to keep location names in sync across all three groups of
files that reference them:
  - scripts/autotracking/location_mapping.lua   (AP_ID -> code, fully regenerated)
  - locations/*.json                            (one file per world; the standalone
                                                    location+section, and its mirrored
                                                    section under "<World> - All Checks")
  - scripts/autotracking/autotracking.lua        (OVERWORLD_SECTION_MAP mirror entry)

Each AP id resolves to a (location_name, section_name) pair, i.e. the two
halves of a PopTracker code "@<location_name>/<section_name>":

  1. If the id is listed under "groups" in scripts/tools/location_names.json,
     it shares a hand-curated location pin with other ids (e.g. several
     physically-clustered chests shown as one map pin). location_name is the
     group's key; section_name is exactly what's configured for that id.
     This is how existing curation like "Huddled Isles - Chests 1+21+22"
     (three chest ids, one pin) is preserved -- it is NOT derivable from the
     AP source data and must be maintained by hand in the registry.
  2. Else if the id is listed under "overrides", location_name == section_name
     == the override (a hand-curated friendly rename, e.g. for an opaque
     "Victory Bonus NNN" AP name).
  3. Else location_name == section_name == location_description from the
     source data, except treasures, which become "<World> - Chest <n> (<Size>, <Area>)" from the
     appearance number leading that description (see display_name_for in
     regenerate_location_mapping.py).

IDs always come from BASE_LOCATION_ID + index in the source "locations" array
(see regenerate_location_mapping.py for how this was verified), independent of
which name is chosen.

locations/*.json and autotracking.lua are updated with the same string-replace
approach as rename_location.py: only name strings are swapped (once per
distinct old->new pair, so a group rename doesn't get replaced redundantly
once per member id), so access_rules/map_locations/item_count etc. attached
to a section are preserved untouched. This is a blunt global text replace,
same caveat as rename_location.py: re-grep afterwards to confirm nothing
unintended was touched, especially for short/common name fragments.

Usage:
    python scripts/tools/sync_location_names.py --data extracted_locations.json
    python scripts/tools/sync_location_names.py --data extracted_locations.json --dry-run
"""
import argparse
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
LOCATION_MAPPING_LUA = ROOT / "scripts" / "autotracking" / "location_mapping.lua"
LOCATIONS_DIR = ROOT / "locations"
AUTOTRACKING_LUA = ROOT / "scripts" / "autotracking" / "autotracking.lua"
NAMES_REGISTRY = ROOT / "scripts" / "tools" / "location_names.json"

BASE_LOCATION_ID = 0x4B483300
ROCK_TITAN_NO_WALL_RUN_BONUS_LOCATION_NAME = "Olympus - Rock Titan Sequence Break Bonus"
ROCK_TITAN_NO_WALL_RUN_BONUS_LOCATION_ID = BASE_LOCATION_ID + 0xFFFF


def build_raw_records(data: dict) -> dict[int, str]:
    """Returns {ap_id: raw_ap_name}."""
    locations = data["locations"]
    names = [loc["name"] for loc in locations]
    if len(names) != len(set(names)):
        seen = set()
        dupes = sorted({n for n in names if (n in seen) or seen.add(n)})
        raise SystemExit(f"error: duplicate location names in source data: {dupes}")

    records = {BASE_LOCATION_ID + i: n for i, n in enumerate(names)}
    records[ROCK_TITAN_NO_WALL_RUN_BONUS_LOCATION_ID] = ROCK_TITAN_NO_WALL_RUN_BONUS_LOCATION_NAME
    return records


def load_registry() -> tuple[dict[int, str], dict[int, tuple[str, str]]]:
    """Returns (overrides {id: name}, group_members {id: (group_name, section_name)})."""
    raw = json.loads(NAMES_REGISTRY.read_text(encoding="utf-8")) if NAMES_REGISTRY.exists() else {}
    overrides = {int(k): v for k, v in raw.get("overrides", {}).items()}
    group_members = {}
    for group_name, members in raw.get("groups", {}).items():
        for id_str, section_name in members.items():
            ap_id = int(id_str)
            if ap_id in group_members:
                raise SystemExit(f"error: id {ap_id} appears in more than one group in location_names.json")
            group_members[ap_id] = (group_name, section_name)

    overlap = sorted(set(overrides) & set(group_members))
    if overlap:
        raise SystemExit(f"error: ids listed in both 'overrides' and 'groups' in location_names.json: {overlap}")
    return overrides, group_members


def build_display_records(data: dict, overrides: dict[int, str],
                           group_members: dict[int, tuple[str, str]]) -> dict[int, tuple[str, str]]:
    raw = build_raw_records(data)
    by_raw_name = {loc["name"]: loc for loc in data["locations"]}

    def resolved_name(ap_id: int, raw_name: str) -> str:
        if ap_id in overrides:
            return overrides[ap_id]
        loc = by_raw_name.get(raw_name)
        if loc is not None and loc.get("type") != "treasure":
            return loc.get("location_description") or raw_name
        return raw_name

    records: dict[int, tuple[str, str]] = {}
    for ap_id, raw_name in raw.items():
        if ap_id in group_members:
            group_name, section_name = group_members[ap_id]
            records[ap_id] = (group_name, section_name)
        else:
            name = resolved_name(ap_id, raw_name)
            records[ap_id] = (name, name)

    unknown_registry_ids = sorted((set(overrides) | set(group_members)) - set(raw))
    if unknown_registry_ids:
        print(f"warning: location_names.json has entries for ids not found in source data: {unknown_registry_ids}")

    codes = [f"{loc}/{sec}" for loc, sec in records.values()]
    if len(codes) != len(set(codes)):
        seen = set()
        dupes = sorted({c for c in codes if (c in seen) or seen.add(c)})
        print(f"warning: multiple ids resolved to the same code; they'll collide in "
              f"location_mapping.lua: {dupes}")
    return records


def render_lua(records: dict[int, tuple[str, str]]) -> str:
    lines = ["-- Auto-generated from KH3 Archipelago", "", "LOCATION_MAPPING = {"]
    for ap_id, (loc, sec) in sorted(records.items()):
        lines.append(f'    [{ap_id}] = {{ code = "@{loc}/{sec}" }},')
    lines.append("}")
    lines.append("")
    return "\n".join(lines)


def parse_mapping_lua(text: str) -> dict[int, tuple[str, str]]:
    records = {}
    pattern = re.compile(r'\[(\d+)\]\s*=\s*\{\s*code\s*=\s*"@([^/"]+)/([^"]+)"')
    for m in pattern.finditer(text):
        records[int(m.group(1))] = (m.group(2), m.group(3))
    return records


def replace_quoted_all(text: str, old: str, new: str) -> tuple[str, int]:
    pattern = re.compile(r'"' + re.escape(old) + r'"')
    return pattern.subn(f'"{new}"', text)


OVERWORLD_ENTRY_RE = re.compile(
    r'\["(?P<key>[^"]+)"\]\s*=\s*"@(?P<world>[^/"]+)/(?P<val_sec>[^"]+)"'
)


def replace_overworld_map(text: str, old: str, new: str) -> tuple[str, int]:
    count = 0

    def sub(m: re.Match) -> str:
        nonlocal count
        key, world, val_sec = m.group("key"), m.group("world"), m.group("val_sec")
        if key == old:
            key = new
            count += 1
        if val_sec == old:
            val_sec = new
            count += 1
        return f'["{key}"] = "@{world}/{val_sec}"'

    return OVERWORLD_ENTRY_RE.sub(sub, text), count


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--data", required=True, type=Path, help="Path to the extracted_locations.json source data")
    ap.add_argument("--dry-run", action="store_true", help="Print what would change without writing anything")
    args = ap.parse_args()

    data = json.loads(args.data.read_text(encoding="utf-8"))
    overrides, group_members = load_registry()

    new_records = build_display_records(data, overrides, group_members)
    new_mapping_text = render_lua(new_records)

    old_mapping_text = LOCATION_MAPPING_LUA.read_text(encoding="utf-8") if LOCATION_MAPPING_LUA.exists() else ""
    old_records = parse_mapping_lua(old_mapping_text)

    added = sorted(set(new_records) - set(old_records))
    removed = sorted(set(old_records) - set(new_records))
    changed = [(i, old_records[i], new_records[i])
               for i in sorted(set(new_records) & set(old_records))
               if new_records[i] != old_records[i]]

    print(f"New locations: {len(added)}")
    for i in added:
        loc, sec = new_records[i]
        print(f"  + [{i}] {loc}/{sec}")
    print(f"Removed locations: {len(removed)}")
    for i in removed:
        loc, sec = old_records[i]
        print(f"  - [{i}] {loc}/{sec}")
    print(f"Changes: {len(changed)}")
    for i, (old_loc, old_sec), (new_loc, new_sec) in changed:
        print(f"  ~ [{i}] {old_loc}/{old_sec!r} -> {new_loc}/{new_sec!r}")

    if args.dry_run:
        print("\nDry run: no files written.")
        return

    LOCATION_MAPPING_LUA.write_text(new_mapping_text, encoding="utf-8")
    print(f"\nWrote {LOCATION_MAPPING_LUA.relative_to(ROOT)} ({len(new_records)} locations).")

    if not changed:
        print("No name changes to propagate to locations/*.json / autotracking.lua.")
        return

    # Collect distinct old->new string substitutions, separately for the
    # location half and the section half, so a group rename that touches many
    # ids only triggers one substitution instead of one per member.
    loc_subs: dict[str, str] = {}
    sec_subs: dict[str, str] = {}
    for _, (old_loc, old_sec), (new_loc, new_sec) in changed:
        if old_loc != new_loc:
            if old_loc in loc_subs and loc_subs[old_loc] != new_loc:
                print(f"  warning: {old_loc!r} would be renamed to two different things "
                      f"({loc_subs[old_loc]!r} and {new_loc!r}); skipping the second.")
            else:
                loc_subs[old_loc] = new_loc
        if old_sec != new_sec:
            if old_sec in sec_subs and sec_subs[old_sec] != new_sec:
                print(f"  warning: {old_sec!r} would be renamed to two different things "
                      f"({sec_subs[old_sec]!r} and {new_sec!r}); skipping the second.")
            else:
                sec_subs[old_sec] = new_sec

    location_files = sorted(LOCATIONS_DIR.glob("*.json"))
    file_texts = {p: p.read_text(encoding="utf-8") for p in location_files}
    auto_text = AUTOTRACKING_LUA.read_text(encoding="utf-8")
    total_json = 0
    total_auto = 0
    for old_name, new_name in {**loc_subs, **sec_subs}.items():
        n1 = 0
        for p, text in file_texts.items():
            new_text, count = replace_quoted_all(text, old_name, new_name)
            file_texts[p] = new_text
            n1 += count
        auto_text, n2 = replace_overworld_map(auto_text, old_name, new_name)
        total_json += n1
        total_auto += n2
        if n1 == 0 and n2 == 0:
            print(f"  note: {old_name!r} -> {new_name!r} found no occurrences in "
                  f"locations/*.json/autotracking.lua (likely a brand-new location; "
                  f"add it there by hand).")

    for p, text in file_texts.items():
        p.write_text(text, encoding="utf-8")
    AUTOTRACKING_LUA.write_text(auto_text, encoding="utf-8")
    print(f"Updated {LOCATIONS_DIR.relative_to(ROOT)}/*.json ({total_json} occurrence(s)).")
    print(f"Updated {AUTOTRACKING_LUA.relative_to(ROOT)} ({total_auto} occurrence(s)).")
    print("\nSanity check: grep for any old names left behind, especially for short/common ones.")


if __name__ == "__main__":
    main()
