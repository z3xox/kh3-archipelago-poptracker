#!/usr/bin/env python3
"""
Headless simulation of Chestsanity (apworld option chestsanity).

Reuses simulate_space.py's PopTracker mock with a few chest files and feeds
onClear the KH3 wire slot_data shape: location_catalog.entries =
[[ap_id, assignment_index, changes, removed], ...], where changes carries the
chest's keyblade_chest_keyblade / keyblade_chest_native
(KeybladeChests.assign_keyblade_chests). A chest needs its assigned keyblade
unless it is its own world's; checks anchored on a chest inherit it.

Needs `pip install lupa`.  Usage:  python scripts/tools/simulate_chestsanity.py
"""
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from simulate_space import Sim, load_json  # noqa: E402

OLY = "Olympus - Chest 29 (Large Chest, Realm of the Gods: Corridors)"
OLY_ID = 1263022848
ARE = "Arendelle - Chest 1 (Large Chest, The North Mountain: Treescape)"
ARE_ID = 1263022969
ARE_PICKUP = ("Ingredients+ - Arendelle - Chest 1 (Large Chest, The North Mountain: Treescape)",
              "Ingredients+ - Arendelle - Pickup 007")


class ChestSim(Sim):
    def __init__(self):
        super().__init__()
        for rel in ("locations/olympus_chests.json", "locations/arendelle_chests.json",
                    "locations/ingredients_plus.json"):
            for top in load_json(rel):
                self._index(top, [])
        self.n = 0

    def give(self, *names):
        for name in names:
            self.n += 1
            self.item(name, self.n)

    def connect(self, chests, **options):
        """chests: {ap_id: (keyblade item name, native)}"""
        t = self.lua.table_from
        entries = [t([ap_id, 0, t({"keyblade_chest_keyblade": blade, "keyblade_chest_native": native}), t([])])
                   for ap_id, (blade, native) in chests.items()]
        options["location_catalog"] = t({"version": 1, "entries": t(entries)})
        self.clear(**options)

    def open(self, location, section=None):
        return self.accessible(location, section or location)


def main():
    results = []

    def check(label, ok):
        results.append(ok)
        print(f"  {'ok  ' if ok else 'FAIL'} {label}")

    sim = ChestSim()

    # 1. no assignment (option off, or offline): chests keep their own rules
    sim.clear()
    sim.give("Hero's Origin", "Unlock: Wall Run", "Crystal Snow")
    check("no Chestsanity: Olympus chest open", sim.open(OLY))
    check("no Chestsanity: Arendelle chest open", sim.open(ARE))

    # 2. Chestsanity on
    sim.connect({OLY_ID: ("Nano Gear", False), ARE_ID: ("Crystal Snow", True)}, chestsanity=1)
    check("setting follows slot_data", sim.code_count("active_chestsanity") == 1)
    sim.give("Hero's Origin", "Unlock: Wall Run", "Crystal Snow")
    check("foreign keyblade missing: Olympus chest closed", not sim.open(OLY))
    check("own world keyblade (native): Arendelle chest open", sim.open(ARE))
    sim.give("Nano Gear")
    check("assigned keyblade received: Olympus chest open", sim.open(OLY))

    # 3. a check anchored on a chest inherits its keyblade
    sim.connect({ARE_ID: ("Wheel of Fate", False)}, chestsanity=1, ingredients=2)
    check("Ingredients+ pool active", sim.code_count("active_ingredients_plus") == 1)
    sim.give("Crystal Snow")
    check("chest needs Wheel of Fate", not sim.open(ARE))
    check("its ingredient pickup too", not sim.open(*ARE_PICKUP))
    sim.give("Wheel of Fate")
    check("with Wheel of Fate both open", sim.open(ARE) and sim.open(*ARE_PICKUP))

    # 4. reconnecting drops the previous seed's assignments
    sim.clear()
    sim.give("Hero's Origin", "Unlock: Wall Run")
    check("reconnect without Chestsanity: Olympus chest open again", sim.open(OLY))

    print(f"\n{sum(results)}/{len(results)} checks passed")
    sys.exit(0 if all(results) else 1)


if __name__ == "__main__":
    main()
