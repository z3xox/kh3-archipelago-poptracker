#!/usr/bin/env python3
"""
Check that every code in the autotracking maps actually resolves to a real
location/section defined under locations/.

A PopTracker code is "@<location name>/<section name>". If either half is
misspelled -- or if a section gets renamed in locations/*.json without the
mapping following -- `Tracker:FindObjectForCode` simply returns nothing and the
check silently never clears. Nothing crashes, nothing logs: the location just
stops autotracking. That failure mode is invisible in-game, which is exactly
why it needs a check.

This validates three things:

  1. scripts/autotracking/location_mapping.lua -- every AP id's code resolves.
  2. scripts/autotracking/autotracking.lua's OVERWORLD_SECTION_MAP -- every
     mirror code resolves (these drive the "<World> - All Checks" highlight).
  3. locations/*.json "ref" strings -- every mirrored section points at a real
     section.

Location and section names are compared case-insensitively, matching
PopTracker's own lookup, but a name that only differs by case is reported as a
warning since it makes the files harder to grep and to keep in sync.

Variant-specific files (san_fransokyo_events_light/dark.json) are both loaded:
a code is considered resolvable if it resolves in *either* variant, since only
one is ever loaded at a time (see scripts/locations.lua).

Usage:
    python scripts/tools/check_location_mapping_integrity.py
Exits non-zero if any code dangles.
"""
import json
import re
import sys
from collections import defaultdict
from pathlib import Path

# Location names carry characters (e.g. the chi in "Dark Inferno χ") that the
# default Windows console codepage cannot encode, which otherwise aborts a run
# mid-report with UnicodeEncodeError.
if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.stderr.reconfigure(encoding="utf-8", errors="replace")

ROOT = Path(__file__).resolve().parents[2]
LOCATIONS_DIR = ROOT / "locations"
LOCATION_NAMES = ROOT / "scripts" / "tools" / "location_names.json"
LOCATION_MAPPING_LUA = ROOT / "scripts" / "autotracking" / "location_mapping.lua"
AUTOTRACKING_LUA = ROOT / "scripts" / "autotracking" / "autotracking.lua"
ITEM_MAPPING_LUA = ROOT / "scripts" / "autotracking" / "item_mapping.lua"
ITEM_FILES = ("items/items.json", "items/settings.json", "items/melody_of_memory.json")

CODE_RE = re.compile(r'\[(\d+)\]\s*=\s*\{\s*code\s*=\s*"([^"]+)"')
# A value is either one code or a {list} of them: a section can be mirrored by
# several Overworld pins (an ingredient spot sits under both its world's pin and
# the global Ingredients pin).
OVERWORLD_RE = re.compile(r'\["([^"]+)"\]\s*=\s*(\{[^}]*\}|"[^"]*")')
QUOTED_RE = re.compile(r'"([^"]*)"')


def collect_sections() -> tuple[dict[str, set[str]], dict[str, str]]:
    """Returns ({lowercased location name: {lowercased section names}}, {lowered: original})."""
    sections: dict[str, set[str]] = defaultdict(set)
    original_case: dict[str, str] = {}

    def visit(node, inherited_parent=None):
        if isinstance(node, list):
            for child in node:
                visit(child, inherited_parent)
            return
        if not isinstance(node, dict):
            return

        name = node.get("name")
        if name is not None:
            original_case.setdefault(name.casefold(), name)

        if "sections" in node and name is not None:
            key = name.casefold()
            for section in node["sections"]:
                section_name = section.get("name")
                if section_name is None:
                    # A nameless section is addressed by its location alone.
                    continue
                sections[key].add(section_name.casefold())
                original_case.setdefault(section_name.casefold(), section_name)

        for child in node.get("children", []) or []:
            visit(child, name)

    for path in sorted(LOCATIONS_DIR.glob("*.json")):
        visit(json.loads(path.read_text(encoding="utf-8")))

    return sections, original_case


def check_code(code: str, sections: dict[str, set[str]]) -> str | None:
    """Returns None if the code resolves, else a reason."""
    if not code.startswith("@"):
        return "does not start with '@'"
    body = code[1:]
    if "/" not in body:
        return "missing '/' between location and section"
    location, section = body.split("/", 1)
    known = sections.get(location.casefold())
    if known is None:
        return f"no location named {location!r}"
    if section.casefold() not in known:
        return f"location {location!r} has no section {section!r}"
    return None


def check_refs(sections: dict[str, set[str]]) -> list[str]:
    """locations/*.json 'ref' strings: '<parent>/<location>/<section>'."""
    problems = []
    for path in sorted(LOCATIONS_DIR.glob("*.json")):
        text = path.read_text(encoding="utf-8")
        for ref in re.findall(r'"ref"\s*:\s*"([^"]+)"', text):
            parts = ref.split("/")
            if len(parts) < 2:
                problems.append(f"{path.name}: ref {ref!r} has no section component")
                continue
            location, section = parts[-2], parts[-1]
            known = sections.get(location.casefold())
            if known is None:
                problems.append(f"{path.name}: ref {ref!r} -> no location named {location!r}")
            elif section.casefold() not in known:
                problems.append(f"{path.name}: ref {ref!r} -> {location!r} has no section {section!r}")
    return problems


def main() -> None:
    sections, original_case = collect_sections()
    total_sections = sum(len(v) for v in sections.values())
    print(f"indexed {len(sections)} locations / {total_sections} sections from locations/*.json")

    failures: list[str] = []
    case_warnings: list[str] = []

    mapping_text = LOCATION_MAPPING_LUA.read_text(encoding="utf-8")
    mapping = [(int(ap_id), code) for ap_id, code in CODE_RE.findall(mapping_text)]
    for ap_id, code in mapping:
        reason = check_code(code, sections)
        if reason:
            failures.append(f"location_mapping.lua [{ap_id}] {code!r}: {reason}")
        else:
            location, section = code[1:].split("/", 1)
            for part in (location, section):
                canonical = original_case.get(part.casefold())
                if canonical is not None and canonical != part:
                    case_warnings.append(
                        f"location_mapping.lua [{ap_id}]: {part!r} is spelled {canonical!r} in locations/"
                    )
    print(f"checked {len(mapping)} location_mapping.lua codes")

    autotracking_text = AUTOTRACKING_LUA.read_text(encoding="utf-8")
    overworld_block = autotracking_text.split("OVERWORLD_SECTION_MAP", 1)
    overworld_pairs = []
    if len(overworld_block) > 1:
        body = overworld_block[1].split("\n}", 1)[0]
        overworld_pairs = [
            (source_section, code)
            for source_section, value in OVERWORLD_RE.findall(body)
            for code in QUOTED_RE.findall(value)
        ]
        for source_section, code in overworld_pairs:
            reason = check_code(code, sections)
            if reason:
                failures.append(
                    f"autotracking.lua OVERWORLD_SECTION_MAP[{source_section!r}] {code!r}: {reason}"
                )
    print(f"checked {len(overworld_pairs)} OVERWORLD_SECTION_MAP codes")

    # item_mapping.lua pointing at an item the pack never defines is the same
    # silent failure in the other direction: the autotracker receives the item
    # and has nothing to update, logging "Did not find object for code ...".
    declared = set()
    for name in ITEM_FILES:
        path = ROOT / name
        if not path.exists():
            continue
        for item in json.loads(path.read_text(encoding="utf-8")):
            sources = [item.get("codes", "")] + [s.get("codes", "") for s in item.get("stages", [])]
            for source in sources:
                declared.update(c.strip() for c in (source or "").split(",") if c.strip())
    item_rows = re.findall(r'\["([^"]+)"\]\s*=\s*\{\s*code\s*=\s*"([^"]+)"',
                           ITEM_MAPPING_LUA.read_text(encoding="utf-8"))
    for ap_item, code in item_rows:
        if code not in declared:
            failures.append(
                f"item_mapping.lua [{ap_item!r}] -> {code!r}: no item declares this code"
            )
    print(f"checked {len(item_rows)} item_mapping.lua codes against {len(declared)} declared codes")

    ref_problems = check_refs(sections)
    failures.extend(ref_problems)
    print("checked locations/*.json ref strings")

    # "/" separates the halves of a code and the segments of a ref, so a name
    # containing one can never be addressed. AP location names do contain them
    # (the "KINGDOM HEARTS 358/2 Days" song series), so the tracker-side name
    # has to be sanitized when such a location is imported.
    slashed = sorted(
        {name for name in original_case.values() if "/" in name}
    )
    for name in slashed:
        failures.append(f"locations/*.json: name {name!r} contains '/', which cannot be addressed")
    print(f"checked {len(original_case)} names for '/'")

    # Locations the apworld never turns into checks must not be mapped: an entry
    # for one is a check that can only ever sit unfilled. See the "excluded"
    # block of location_names.json for why each id is there.
    if LOCATION_NAMES.exists():
        excluded = json.loads(LOCATION_NAMES.read_text(encoding="utf-8")).get("excluded", {})
        mapped_ids = {ap_id for ap_id, _ in mapping}
        for ap_id_text, info in sorted(excluded.items()):
            if int(ap_id_text) in mapped_ids:
                failures.append(
                    f"location_mapping.lua [{ap_id_text}] maps {info['name']!r}, "
                    f"which is never a check ({info['reason']})"
                )
        print(f"checked {len(excluded)} excluded ids are not mapped")

    if case_warnings:
        print(f"\n{len(case_warnings)} case mismatch(es) (resolve fine, but confusing):")
        for warning in sorted(set(case_warnings))[:20]:
            print(f"  ! {warning}")
        if len(set(case_warnings)) > 20:
            print(f"  ... and {len(set(case_warnings)) - 20} more")

    if failures:
        print(f"\n{len(failures)} dangling code(s):")
        for failure in failures:
            print(f"  x {failure}")
        sys.exit(1)

    print("\nok: every code resolves")


if __name__ == "__main__":
    main()
