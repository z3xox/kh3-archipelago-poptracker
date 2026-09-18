#!/usr/bin/env python3
"""
Validate every pack file against PopTracker's own JSON schemas.

PopTracker ships authoritative schemas under <poptracker>/schema/packs. They
catch a whole class of mistakes the tracker itself reports only as a vague load
error (or silently ignores): a misspelled key, a string where a list belongs, a
progressive item missing its stages, an unknown field on a section.

This is the cheapest real check available on the pack, so run it before every
release. It complements check_location_mapping_integrity.py, which checks the
things a schema cannot: that codes actually point at something.

The schema directory is found, in order, from --schema-dir, the POPTRACKER_DIR
environment variable, or by walking up from the pack (packs/<pack>/ -> ../..).

Usage:
    python scripts/tools/check_pack_schema.py
    python scripts/tools/check_pack_schema.py --schema-dir /path/to/poptracker/schema/packs
    python scripts/tools/check_pack_schema.py --strict
"""
import argparse
import json
import os
import sys
from pathlib import Path

try:
    import jsonschema
except ImportError:
    sys.exit("error: this check needs jsonschema (pip install jsonschema)")

ROOT = Path(__file__).resolve().parents[2]

# schema file -> the pack files it governs (globs are resolved against ROOT)
TARGETS = {
    "manifest.json": ["manifest.json"],
    "items.json": ["items/*.json"],
    "locations.json": ["locations/*.json"],
    "maps.json": ["maps/*.json"],
    "layouts.json": ["layouts/*.json"],
}


def find_schema_dir(explicit: Path | None, strict: bool) -> Path:
    candidates = []
    if explicit:
        candidates.append(explicit)
    if os.environ.get("POPTRACKER_DIR"):
        candidates.append(Path(os.environ["POPTRACKER_DIR"]) / "schema" / "packs")
    # A pack normally lives at <poptracker>/packs/<pack>/.
    candidates.append(ROOT.parent.parent / "schema" / "packs")

    for candidate in candidates:
        target = candidate / "strict" if strict else candidate
        if (target / "items.json").exists():
            return target
    sys.exit(
        "error: could not find PopTracker's schema/packs directory. "
        "Pass --schema-dir or set POPTRACKER_DIR."
    )


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__,
                                     formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--schema-dir", type=Path, default=None)
    parser.add_argument("--strict", action="store_true",
                        help="use the strict schemas, which also reject unknown properties")
    parser.add_argument("-q", "--quiet", action="store_true", help="only report failures")
    args = parser.parse_args()

    schema_dir = find_schema_dir(args.schema_dir, args.strict)
    print(f"schemas: {schema_dir}")

    checked = 0
    failures = 0
    for schema_name, patterns in TARGETS.items():
        schema_path = schema_dir / schema_name
        if not schema_path.exists():
            print(f"! no schema for {schema_name}, skipping")
            continue
        validator = jsonschema.Draft7Validator(
            json.loads(schema_path.read_text(encoding="utf-8"))
        )
        paths = sorted(p for pattern in patterns for p in ROOT.glob(pattern))
        for path in paths:
            relative = path.relative_to(ROOT).as_posix()
            checked += 1
            try:
                document = json.loads(path.read_text(encoding="utf-8"))
            except json.JSONDecodeError as exc:
                failures += 1
                print(f"  x {relative}: invalid JSON -- {exc}")
                continue
            errors = sorted(validator.iter_errors(document), key=lambda e: list(e.path))
            if errors:
                failures += 1
                print(f"  x {relative} ({schema_name}): {len(errors)} error(s)")
                for error in errors[:5]:
                    where = "/".join(str(part) for part in error.path) or "<root>"
                    print(f"      at {where}: {error.message}")
                if len(errors) > 5:
                    print(f"      ... and {len(errors) - 5} more")
            elif not args.quiet:
                print(f"  ok {relative}")

    print(f"\n{checked} file(s) checked, {failures} failed")
    sys.exit(1 if failures else 0)


if __name__ == "__main__":
    main()
