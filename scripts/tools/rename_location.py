#!/usr/bin/env python3
"""
Rename a tracked location by its Archipelago location ID.

The AP location ID is the only stable identifier; the PopTracker "code" for a
section is always derived as "@<location name>/<section name>", so renaming a
check means updating the same string in up to three places:
  - locations/*.json              (one file per world; the standalone
                                    location+section, and its mirrored section
                                    under "<World> - All Checks")
  - scripts/autotracking/location_mapping.lua   (AP_ID -> code)
  - scripts/autotracking/autotracking.lua       (OVERWORLD_SECTION_MAP mirror entry)

This script finds the current name for a given AP id and replaces every exact
occurrence of it (as a JSON/Lua string, not a substring) with the new name.

Usage:
    python scripts/tools/rename_location.py --id 1263023184 --new "Olympus - Defeat Darkside (Final World)"
    python scripts/tools/rename_location.py --id 1263023184 --new "..." --dry-run
"""
import argparse
import re
import sys
from pathlib import Path

# Location names carry characters (e.g. the chi in "Dark Inferno χ") that the
# default Windows console codepage cannot encode, which otherwise aborts a run
# mid-report with UnicodeEncodeError.
if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.stderr.reconfigure(encoding="utf-8", errors="replace")

ROOT = Path(__file__).resolve().parents[2]
LOCATIONS_DIR = ROOT / "locations"
LOCATION_MAPPING_LUA = ROOT / "scripts" / "autotracking" / "location_mapping.lua"
AUTOTRACKING_LUA = ROOT / "scripts" / "autotracking" / "autotracking.lua"

MAPPING_LINE_RE = re.compile(
    r'\[(?P<id>\d+)\]\s*=\s*\{\s*code\s*=\s*"@(?P<loc>[^/"]+)/(?P<sec>[^"]+)"\s*\}'
)
# OVERWORLD_SECTION_MAP entries: ["<section>"] = "@<World> - All Checks/<section>",
OVERWORLD_ENTRY_RE = re.compile(
    r'\["(?P<key>[^"]+)"\]\s*=\s*"@(?P<world>[^/"]+)/(?P<val_sec>[^"]+)"'
)


def find_current_name(ap_id: int) -> str:
    text = LOCATION_MAPPING_LUA.read_text(encoding="utf-8")
    for m in MAPPING_LINE_RE.finditer(text):
        if int(m.group("id")) == ap_id:
            loc, sec = m.group("loc"), m.group("sec")
            if loc != sec:
                print(f"warning: location part ({loc!r}) and section part ({sec!r}) "
                      f"differ for id {ap_id}; using the section part as the name to rename.",
                      file=sys.stderr)
            return sec
    raise SystemExit(f"error: no location_mapping.lua entry found for AP id {ap_id}")


def replace_quoted(text: str, old: str, new: str) -> tuple[str, int]:
    """Exact-match replace of a whole quoted JSON/Lua string value."""
    pattern = re.compile(r'"' + re.escape(old) + r'"')
    new_text, count = pattern.subn(f'"{new}"', text)
    return new_text, count


def replace_mapping_lua(text: str, ap_id: int, old: str, new: str) -> tuple[str, int]:
    count = 0

    def sub(m: re.Match) -> str:
        nonlocal count
        if int(m.group("id")) != ap_id:
            return m.group(0)
        loc, sec = m.group("loc"), m.group("sec")
        if loc == old:
            loc = new
            count += 1
        if sec == old:
            sec = new
            count += 1
        return f'[{m.group("id")}] = {{ code = "@{loc}/{sec}" }}'

    return MAPPING_LINE_RE.sub(sub, text), count


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
    ap.add_argument("--id", type=int, required=True, help="Archipelago location ID")
    ap.add_argument("--new", required=True, help="New display name")
    ap.add_argument("--old", help="Override the old name lookup (skip location_mapping.lua scan)")
    ap.add_argument("--dry-run", action="store_true", help="Show what would change without writing files")
    args = ap.parse_args()

    old_name = args.old or find_current_name(args.id)
    new_name = args.new

    if old_name == new_name:
        raise SystemExit("error: old and new name are identical, nothing to do")

    print(f"Renaming AP id {args.id}: {old_name!r} -> {new_name!r}\n")

    total = 0

    for path in sorted(LOCATIONS_DIR.glob("*.json")):
        json_text = path.read_text(encoding="utf-8")
        json_new, json_count = replace_quoted(json_text, old_name, new_name)
        total += json_count
        rel = path.relative_to(ROOT)
        print(f"  {rel}: {json_count} occurrence(s)")
        if json_count and not args.dry_run:
            path.write_text(json_new, encoding="utf-8")

    mapping_text = LOCATION_MAPPING_LUA.read_text(encoding="utf-8")
    mapping_new, mapping_count = replace_mapping_lua(mapping_text, args.id, old_name, new_name)

    auto_text = AUTOTRACKING_LUA.read_text(encoding="utf-8")
    auto_new, auto_count = replace_overworld_map(auto_text, old_name, new_name)

    for path, new_text, count in (
        (LOCATION_MAPPING_LUA, mapping_new, mapping_count),
        (AUTOTRACKING_LUA, auto_new, auto_count),
    ):
        total += count
        rel = path.relative_to(ROOT)
        print(f"  {rel}: {count} occurrence(s)")
        if count and not args.dry_run:
            path.write_text(new_text, encoding="utf-8")

    if total == 0:
        raise SystemExit(f"\nerror: found zero occurrences of {old_name!r} anywhere; aborting, nothing changed")

    if args.dry_run:
        print(f"\nDry run: {total} occurrence(s) would be replaced. Re-run without --dry-run to apply.")
    else:
        print(f"\nDone: {total} occurrence(s) replaced.")
        print("Sanity check: grep the old name to confirm nothing was missed:")
        print(f'  grep -rn "{old_name}" "{ROOT}"')


if __name__ == "__main__":
    main()
