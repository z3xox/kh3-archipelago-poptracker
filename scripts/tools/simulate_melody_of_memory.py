#!/usr/bin/env python3
"""
Headless simulation of the Melody of Memory activation from slot_data.

apworld 0.17 sends the seed's locations as references to its bundled catalog
(location_catalog.entries = [[ap_id, ...], ...]) instead of bridge.locations.
autoFill must still light up the songs whose clear is a check
(MOM_LOCATION_ID_BASE + song_id) and the authored Melody Chests (their own ids).

Needs `pip install lupa`.  Usage:  python scripts/tools/simulate_melody_of_memory.py
"""
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from simulate_space import Sim, load_json  # noqa: E402

MOM_BASE = 1263153920
OLYMPUS_CHEST = 1263154177


class MomSim(Sim):
    def __init__(self):
        super().__init__()
        for item in load_json("items/melody_of_memory.json"):
            self.lua.globals().mock_add_item(self.lua.table_from(self._lua_def(item)))

    def connect(self, ap_ids, **options):
        t = self.lua.table_from
        entries = [t([ap_id, 0, t({}), t([])]) for ap_id in ap_ids]
        options["location_catalog"] = t({"version": 1, "entries": t(entries)})
        self.clear(**options)


def main():
    results = []

    def check(label, ok):
        results.append(ok)
        print(f"  {'ok  ' if ok else 'FAIL'} {label}")

    sim = MomSim()
    sim.connect([MOM_BASE + 5, MOM_BASE + 206, OLYMPUS_CHEST, 1263022848], music_chest_count=1)
    check("song 5 in the seed is active", sim.code_count("mom_song_5") == 1)
    check("song 206 in the seed is active", sim.code_count("mom_song_206") == 1)
    check("song 6 absent from the seed stays off", sim.code_count("mom_song_6") == 0)
    check("Olympus Melody Chest active", sim.code_count("mc_chest_olympus") == 1)
    check("Arendelle Melody Chest off", sim.code_count("mc_chest_arendelle") == 0)

    sim.connect([1263022848])
    check("reconnect to a seed without MoM turns everything off",
          sim.code_count("mom_song_5") == 0 and sim.code_count("mc_chest_olympus") == 0)

    print(f"\n{sum(results)}/{len(results)} checks passed")
    sys.exit(0 if all(results) else 1)


if __name__ == "__main__":
    main()
