#!/usr/bin/env python3
"""
Headless simulation of Melody of Memory from slot_data.

apworld 0.17 sends the seed's locations as references to its bundled catalog
(location_catalog.entries = [[ap_id, assignment, changes, removed], ...]) instead
of bridge.locations, and every selected song opens a music chest: an authored
Melody Chest or a converted vanilla chest, whose changes carry mom_song_id. The
song's section then mirrors its chest: visible, in logic with it, and cleared by
the chest's Song Bonus (or the chest itself without bonus checks). Song-clear
checks of older seeds (MOM_LOCATION_ID_BASE + song id) still light up their song.

Needs `pip install lupa`.  Usage:  python scripts/tools/simulate_melody_of_memory.py
"""
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from simulate_space import Sim, load_json  # noqa: E402

MOM_BASE = 1263153920
OLYMPUS_MELODY_CHEST = 1263154177
CHEST_29 = 1263022848              # Olympus - Chest 29, converted below
CHEST_29_BONUS = CHEST_29 + 0x100000
SONGS = "Melody of Memory - Songs"


class MomSim(Sim):
    def __init__(self):
        super().__init__()
        g = self.lua.globals()
        for item in load_json("items/melody_of_memory.json"):
            g.mock_add_item(self.lua.table_from(self._lua_def(item)))
        known = set(self.codes)
        for rel in ("locations/melody_of_memory.json", "locations/olympus_chests.json"):
            for top in load_json(rel):
                self._index(top, [])
        for code, (_, count) in self.codes.items():
            if code not in known:
                g.mock_add_section(code, count)

    def connect(self, rows, **options):
        """rows: [ap_id or (ap_id, changes)]"""
        t = self.lua.table_from
        entries = []
        for row in rows:
            ap_id, changes = row if isinstance(row, tuple) else (row, {})
            entries.append(t([ap_id, 0, t(changes), t([])]))
        options["location_catalog"] = t({"version": 1, "entries": t(entries)})
        self.clear(**options)

    def song_section(self, song_id):
        return self.lua.eval(f"LOCATION_MAPPING[{MOM_BASE + song_id}].code").split("/", 1)[1]

    def set_access(self, ap_id, level):
        self.lua.execute(f'SECTIONS[LOCATION_MAPPING[{ap_id}].code].AccessibilityLevel = {level}')


def main():
    results = []

    def check(label, ok):
        results.append(ok)
        print(f"  {'ok  ' if ok else 'FAIL'} {label}")

    sim = MomSim()

    # 1. 0.17: songs open music chests
    sim.connect([
        (CHEST_29, {"mom_song_id": 51, "music_chest_kind": "vanilla"}), CHEST_29_BONUS,
        (OLYMPUS_MELODY_CHEST, {"mom_song_id": 18, "music_chest_kind": "additional"}),
    ], music_chest_count=1)
    check("song of a converted chest is shown", sim.code_count("mom_song_51") == 1)
    check("song of a Melody Chest is shown", sim.code_count("mom_song_18") == 1)
    check("other songs stay hidden", sim.code_count("mom_song_6") == 0)
    check("Olympus Melody Chest active", sim.code_count("mc_chest_olympus") == 1)
    check("Arendelle Melody Chest off", sim.code_count("mc_chest_arendelle") == 0)

    song51 = sim.song_section(51)
    sim.set_access(CHEST_29, 0)
    check("song out of logic while its chest is", not sim.accessible(SONGS, song51))
    sim.set_access(CHEST_29, 6)
    check("song in logic once its chest is", sim.accessible(SONGS, song51))

    sim.location(CHEST_29)
    check("opening the chest alone leaves the song (its Song Bonus is the check)",
          sim.section_left(SONGS, song51) == 1)
    sim.location(CHEST_29_BONUS)
    check("the chest's Song Bonus clears the song", sim.section_left(SONGS, song51) == 0)
    sim.location(OLYMPUS_MELODY_CHEST)
    check("without a Song Bonus, the Melody Chest itself clears its song",
          sim.section_left(SONGS, sim.song_section(18)) == 0)

    # 2. older seeds: song-clear checks
    sim.connect([MOM_BASE + 5, MOM_BASE + 206])
    check("legacy song-clear ids still light their song",
          sim.code_count("mom_song_5") == 1 and sim.code_count("mom_song_206") == 1)
    check("reconnect drops the previous seed's songs and chests",
          sim.code_count("mom_song_51") == 0 and sim.code_count("mc_chest_olympus") == 0)

    # 3. offline: the Song Bonuses setting shows every possible one
    sim.clear()
    check("offline: no Song Bonus by default", sim.lua.eval(f"song_bonus({CHEST_29_BONUS})") == 0)
    sim.lua.execute('Tracker:FindObjectForCode("song_bonus_setting").CurrentStage = 1')
    check("Show All setting: every Song Bonus shows", sim.lua.eval(f"song_bonus({CHEST_29_BONUS})") == 1)
    sim.connect([CHEST_29])
    check("connecting resets the setting", sim.code_count("song_bonus_all") == 0)

    print(f"\n{sum(results)}/{len(results)} checks passed")
    sys.exit(0 if all(results) else 1)


if __name__ == "__main__":
    main()
