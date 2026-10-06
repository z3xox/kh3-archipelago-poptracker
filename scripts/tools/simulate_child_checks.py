#!/usr/bin/env python3
"""
Headless simulation of the checks that hang off another one (generate_child_checks.py).

Reuses simulate_space.py's PopTracker mock: the two extra rewards of a victory
bonus and a chest's Song Bonus open with their parent and are cleared, with their
Overworld mirror, by their own AP location id. A Song Bonus only shows when the
seed's slot_data lists it among its checks.

Needs `pip install lupa`.  Usage:  python scripts/tools/simulate_child_checks.py
"""
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from simulate_space import Sim, load_json  # noqa: E402

LOC = "Olympus - Mount Olympus: Cliff Ascent Heartless"
CHEST = "Olympus - Chest 29 (Large Chest, Realm of the Gods: Corridors)"
CHEST_ID = 1263022848
CHEST_BONUS = f"{CHEST} - Song Bonus"


class ChildSim(Sim):
    def __init__(self):
        super().__init__()
        known = set(self.codes)
        for rel in ("locations/olympus_events.json", "locations/olympus_chests.json",
                    "locations/overworld.json"):
            for top in load_json(rel):
                self._index(top, [])
        for code, (_, count) in self.codes.items():
            if code not in known:
                self.lua.globals().mock_add_section(code, count)


def main():
    results = []

    def check(label, ok):
        results.append(ok)
        print(f"  {'ok  ' if ok else 'FAIL'} {label}")

    dump = load_json("scripts/tools/extracted_locations.json")
    extras = {r["name"]: r["ap_id"] for r in dump["extra_vbonus_locations"]}
    bonuses = {r["parent_ap_id"]: r["ap_id"] for r in dump["song_bonus_locations"]}
    sim = ChildSim()

    # 1. extra victory bonus rewards
    sim.clear()
    parent_open = sim.accessible(LOC, LOC)
    check("Reward 2 opens with its parent", sim.accessible(LOC, f"{LOC} - Reward 2") == parent_open)
    sim.item("Hero's Origin", 1)
    check("with Hero's Origin: parent and both extras open",
          all(sim.accessible(LOC, s) for s in (LOC, f"{LOC} - Reward 2", f"{LOC} - Reward 3")))
    sim.location(extras[f"{LOC} - Reward 2"])
    check("onLocation clears Reward 2", sim.section_left(LOC, f"{LOC} - Reward 2") == 0)
    check("onLocation clears its Overworld mirror",
          sim.section_left("Olympus - All Checks", f"{LOC} - Reward 2") == 0)
    check("Reward 3 and the parent stay open", sim.section_left(LOC, f"{LOC} - Reward 3") == 1
          and sim.section_left(LOC, LOC) == 1)

    # 2. music chest Song Bonus
    bonus_id = bonuses[CHEST_ID]
    t = sim.lua.table_from
    sim.clear(location_catalog=t({"version": 1, "entries": t([t([bonus_id, 0, t({}), t([])])])}))
    check("seed lists the Song Bonus: visible", sim.lua.eval(f"song_bonus({bonus_id})") == 1)
    check("another chest's Song Bonus: hidden", sim.lua.eval(f"song_bonus({bonus_id + 1})") == 0)
    sim.item("Hero's Origin", 2)
    check("without Wall Run: chest and Song Bonus closed",
          not sim.accessible(CHEST, CHEST) and not sim.accessible(CHEST, CHEST_BONUS))
    sim.item("Unlock: Wall Run", 3)
    check("with Wall Run: both open", sim.accessible(CHEST, CHEST) and sim.accessible(CHEST, CHEST_BONUS))
    sim.location(bonus_id)
    check("onLocation clears the Song Bonus, not the chest",
          sim.section_left(CHEST, CHEST_BONUS) == 0 and sim.section_left(CHEST, CHEST) == 1)
    sim.clear()
    check("offline: no Song Bonus", sim.lua.eval(f"song_bonus({bonus_id})") == 0)

    print(f"\n{sum(results)}/{len(results)} checks passed")
    sys.exit(0 if all(results) else 1)


if __name__ == "__main__":
    main()
