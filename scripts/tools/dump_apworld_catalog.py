#!/usr/bin/env python3
"""
Dump the KH3 apworld's *finalized* location catalog to a plain JSON file.

Why this exists
---------------
The apworld ships `data/extracted_locations.json`, but that file only holds the
treasure/event rows pulled out of the game data -- 497 entries. Everything else
(victory bonuses, lucky emblems, level ups, the Moogle Shop, Classic Kingdom,
Olympus Coliseum cups and the ingredient checks) is *synthesized at import time*
by `Data.finalize_location_catalogs()`, which `Data.load_extracted_data()` calls
for you. Only after that does the catalog reach its real size (975 locations for
the current apworld).

That matters because AP location IDs are positional:

    ap_id = BASE_LOCATION_ID + index_in_the_finalized_locations_array

so `regenerate_location_mapping.py` must be fed the *finalized* array, never the
497-entry file straight out of the apworld. Feeding it the raw file would
silently renumber nothing but simply drop 478 locations.

Melody of Memory is the one catalog that does NOT live in that array: its checks
are keyed off native Music IDs (`MOM_LOCATION_ID_BASE + song_id`), independent of
catalog order. They're emitted here under a separate "mom_locations" key, each
with its ap_id spelled out.

How it runs without Archipelago
-------------------------------
`Data.py` only needs `BaseClasses` from Archipelago, and only for type names --
so we stub it. The apworld's `__init__.py` pulls in half of Archipelago
(`worlds.AutoWorld`, `worlds.Files`, `Options`, ...), so we blank it out in a
throwaway copy of the package rather than chase every import. Nothing is written
back to the apworld.

Usage:
    python scripts/tools/dump_apworld_catalog.py
    python scripts/tools/dump_apworld_catalog.py --apworld path/to/kh3.apworld -o catalog.json
"""
import argparse
import enum
import json
import shutil
import sys
import tempfile
import types
import zipfile
from importlib import import_module
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
DEFAULT_APWORLD = ROOT / "kh3.apworld"
DEFAULT_OUTPUT = ROOT / "scripts" / "tools" / "extracted_locations.json"

BASE_LOCATION_ID = 0x4B483300


class _Any:
    """Stand-in for any Archipelago class Data.py merely names."""

    def __init__(self, *args, **kwargs):
        pass

    def __getattr__(self, name):
        return _Any()

    def __call__(self, *args, **kwargs):
        return _Any()


def _install_baseclasses_stub() -> None:
    """Provide the only Archipelago module Data.py actually imports."""
    if "BaseClasses" in sys.modules:
        return

    class ItemClassification(enum.IntFlag):
        filler = 1
        progression = 2
        useful = 4
        trap = 8
        skip_balancing = 16
        progression_skip_balancing = 18

    class LocationProgressType(enum.IntEnum):
        DEFAULT = 0
        PRIORITY = 1
        EXCLUDED = 2

    class Region(_Any):
        def __init__(self, *args, **kwargs):
            self.locations = []
            self.exits = []

    module = types.ModuleType("BaseClasses")
    module.Item = type("Item", (_Any,), {})
    module.Location = type("Location", (_Any,), {})
    module.Entrance = type("Entrance", (_Any,), {})
    module.MultiWorld = type("MultiWorld", (_Any,), {})
    module.CollectionState = type("CollectionState", (_Any,), {})
    module.Tutorial = type("Tutorial", (_Any,), {})
    module.Region = Region
    module.ItemClassification = ItemClassification
    module.LocationProgressType = LocationProgressType
    sys.modules["BaseClasses"] = module


def _stage_package(apworld: Path, workdir: Path) -> str:
    """Unzip the apworld into workdir and neutralize its __init__.py.

    Returns the package name (the archive's single top-level directory).
    """
    with zipfile.ZipFile(apworld) as archive:
        archive.extractall(workdir)

    packages = [p for p in workdir.iterdir() if p.is_dir() and (p / "Data.py").exists()]
    if len(packages) != 1:
        raise SystemExit(
            f"error: expected exactly one apworld package with a Data.py in {apworld.name}, "
            f"found {[p.name for p in packages]}"
        )

    package = packages[0]
    # Blanked, not deleted: Data.py uses relative imports, so the package must
    # stay a package -- it just must not drag in the rest of Archipelago.
    (package / "__init__.py").write_text("", encoding="utf-8")
    return package.name


def dump(apworld: Path) -> dict:
    workdir = Path(tempfile.mkdtemp(prefix="kh3-apworld-"))
    try:
        package_name = _stage_package(apworld, workdir)
        _install_baseclasses_stub()
        sys.path.insert(0, str(workdir))
        try:
            data_module = import_module(f"{package_name}.Data")
            mom_module = import_module(f"{package_name}.MelodyOfMemory")
        finally:
            sys.path.remove(str(workdir))

        data = data_module.load_extracted_data()
        locations = data["locations"]

        mom_locations = [
            {
                "ap_id": mom_module.MOM_LOCATION_ID_BASE + song["song_id"],
                "name": mom_module.song_location_name(song),
                "type": "melody_of_memory",
                "world": "Melody of Memory",
                "source_table": "MelodyOfMemory",
                "source_id": str(song["song_id"]),
                "song_id": song["song_id"],
                "song_name": song["name"],
                "series": song["series"],
            }
            for song in mom_module.MOM_SONGS
        ]

        return {
            "meta": {
                **data.get("meta", {}),
                "dumped_from": apworld.name,
                "location_count": len(locations),
                "mom_location_count": len(mom_locations),
                "base_location_id": BASE_LOCATION_ID,
                "mom_location_id_base": mom_module.MOM_LOCATION_ID_BASE,
            },
            "items": data.get("items", []),
            "locations": locations,
            "mom_locations": mom_locations,
        }
    finally:
        shutil.rmtree(workdir, ignore_errors=True)


def main() -> None:
    parser = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument("--apworld", type=Path, default=DEFAULT_APWORLD,
                        help=f"apworld to read (default: {DEFAULT_APWORLD.name} at the repo root)")
    parser.add_argument("-o", "--output", type=Path, default=DEFAULT_OUTPUT,
                        help=f"where to write the catalog (default: {DEFAULT_OUTPUT.relative_to(ROOT)})")
    parser.add_argument("--summary", action="store_true",
                        help="print a per-type/per-world breakdown instead of just the counts")
    args = parser.parse_args()

    if not args.apworld.exists():
        raise SystemExit(f"error: apworld not found: {args.apworld}")

    catalog = dump(args.apworld)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(
        json.dumps(catalog, indent=1, ensure_ascii=False) + "\n",
        encoding="utf-8",
    )

    locations = catalog["locations"]
    print(f"{len(locations)} locations "
          f"(ids {BASE_LOCATION_ID}-{BASE_LOCATION_ID + len(locations) - 1})")
    print(f"{len(catalog['mom_locations'])} Melody of Memory locations "
          f"(separate id base {catalog['meta']['mom_location_id_base']})")
    print(f"-> {args.output}")

    if args.summary:
        from collections import Counter
        print("\nby type:")
        for name, count in Counter(loc.get("type") for loc in locations).most_common():
            print(f"  {count:5d}  {name}")
        print("\nby world:")
        for name, count in Counter(loc.get("world") for loc in locations).most_common():
            print(f"  {count:5d}  {name}")


if __name__ == "__main__":
    main()
