#!/usr/bin/env python3
"""
Check that the vertical and horizontal item trackers show the same items.

layouts/tracker.json ("item_grid") and layouts/tracker_horizontal.json
("item_grid_horizontal") each hand-list the same group headers and itemgrid
rows, just docked in a different direction (top-to-bottom vs left-to-right).
There's no shared source for that item list, so adding/removing/renaming an
item in one file and forgetting the other silently makes the two layouts
disagree on what's tracked.

This walks both group lists and compares, per header, the flattened set of
item codes referenced by their itemgrid rows (order-independent -- only
membership is checked, since row wrapping may differ between orientations).

Usage:
    python scripts/tools/check_layout_item_parity.py
"""
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
VERTICAL = ROOT / "layouts" / "tracker.json"
HORIZONTAL = ROOT / "layouts" / "tracker_horizontal.json"


def _iter_groups(entries):
    """Yield leaf "group" dicts, recursing into "dock" wrappers (the two-column/
    row splits) that hold further groups instead of a header themselves."""
    for entry in entries:
        if entry.get("type") == "dock":
            yield from _iter_groups(entry["content"])
        else:
            yield entry


def item_codes_by_header(path: Path, key: str) -> dict[str, set[str]]:
    with path.open(encoding="utf-8") as f:
        data = json.load(f)
    result = {}
    for group in _iter_groups(data[key]["content"]):
        header = group["header"]
        content = group["content"]
        if content.get("type") == "itemgrid":
            codes = {code for row in content["rows"] for code in row}
        else:
            # e.g. "Goal", which pastes a shared progressive-item layout
            codes = {content.get("key", "")}
        result[header] = codes
    return result


def main() -> None:
    vertical = item_codes_by_header(VERTICAL, "item_grid")
    horizontal = item_codes_by_header(HORIZONTAL, "item_grid_horizontal")

    problems = []
    for header in vertical.keys() - horizontal.keys():
        problems.append(f"'{header}' group is in the vertical layout but missing from horizontal")
    for header in horizontal.keys() - vertical.keys():
        problems.append(f"'{header}' group is in the horizontal layout but missing from vertical")
    for header in vertical.keys() & horizontal.keys():
        only_v = vertical[header] - horizontal[header]
        only_h = horizontal[header] - vertical[header]
        if only_v:
            problems.append(f"'{header}': in vertical only: {sorted(only_v)}")
        if only_h:
            problems.append(f"'{header}': in horizontal only: {sorted(only_h)}")

    if problems:
        print(f"Found {len(problems)} problem(s):")
        for p in problems:
            print(f"  - {p}")
        sys.exit(1)

    print(f"OK: {len(vertical)} groups, same items in both orientations.")


if __name__ == "__main__":
    main()
