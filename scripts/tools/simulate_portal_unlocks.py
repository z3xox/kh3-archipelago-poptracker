#!/usr/bin/env python3
"""
Headless simulation of Portal Unlocks (apworld option portal_unlocks).

Reuses simulate_space.py's PopTracker mock with a few world chest files. With
portal_unlocks = 0 a world opens with its keyblade; with 1 it opens with one of
its party members instead (PORTAL_PARTY_REGION_LOCKS), and the tier-one gate
counts open tier-one worlds either way. Every rule names the world through
"$portal|<keyblade>", so both modes go through logic.lua's portal_open.

Needs `pip install lupa`.  Usage:  python scripts/tools/simulate_portal_unlocks.py
"""
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from simulate_space import Sim, load_json  # noqa: E402

OLY = "Olympus - Chest 29 (Large Chest, Realm of the Gods: Corridors)"
ARE = "Arendelle - Chest 1 (Large Chest, The North Mountain: Treescape)"
KG = "Keyblade Graveyard - Chest 1 (Large Chest, The Badlands)"
KG_NEEDS = ["Ability: Air Slide", "Ability: Block", "Ability: Dodge Roll", "Magic: Cure",
            "Unlock: Attraction Flow", "Unlock: Magic"]


class PortalSim(Sim):
    def __init__(self):
        super().__init__()
        for rel in ("locations/olympus_chests.json", "locations/arendelle_chests.json",
                    "locations/keyblade_graveyard_chests.json"):
            for top in load_json(rel):
                self._index(top, [])
        self.n = 0

    def give(self, *names):
        for name in names:
            self.n += 1
            self.item(name, self.n)

    def open(self, location):
        return self.accessible(location, location)


def main():
    results = []

    def check(label, ok):
        results.append(ok)
        print(f"  {'ok  ' if ok else 'FAIL'} {label}")

    sim = PortalSim()

    # 1. keyblade mode (default)
    sim.clear(portal_unlocks=0)
    check("keyblade mode: portal_party off", sim.code_count("portal_party") == 0)
    sim.give("Party Member: Marshmallow")
    check("Marshmallow is tracked", sim.code_count("party_marshmallow") == 1)
    check("keyblade mode: Marshmallow does not open Arendelle", not sim.open(ARE))
    sim.give("Crystal Snow")
    check("keyblade mode: Crystal Snow opens Arendelle", sim.open(ARE))

    # 2. party-member mode
    sim.clear(portal_unlocks=1)
    check("party mode: portal_party on", sim.code_count("portal_party") == 1)
    sim.give("Crystal Snow", "Hero's Origin", "Unlock: Wall Run")
    check("party mode: Crystal Snow no longer opens Arendelle", not sim.open(ARE))
    check("party mode: Hero's Origin no longer opens Olympus", not sim.open(OLY))
    sim.give("Party Member: Marshmallow", "Party Member: Hercules")
    check("party mode: Marshmallow opens Arendelle", sim.open(ARE))
    check("party mode: Hercules opens Olympus", sim.open(OLY))

    # 3. tier gate counts open tier-one worlds, through their characters
    sim.give(*KG_NEEDS, "Party Member: Ventus")
    check("party mode: Ventus + 2 tier-one worlds: Keyblade Graveyard still gated", not sim.open(KG))
    sim.give("Party Member: Mike")
    check("party mode: 3rd tier-one world (Mike) opens Keyblade Graveyard", sim.open(KG))
    sim.clear(portal_unlocks=1)
    sim.give(*KG_NEEDS, "Starlight", "Favorite Deputy", "Ever After", "Nano Gear")
    check("party mode: keyblades count for nothing at the tier gate", not sim.open(KG))

    # 4. Trinity Fire counts once Twilight Town is reachable, without the tier gate
    sim.clear(portal_unlocks=0, include_space=1)
    sim.give("Shooting Star", "Ability: Block")
    check("Twilight Town reachable with Shooting Star + a defensive ability only",
          sim.lua.eval("space_special_weapons(1)") == 1)

    print(f"\n{sum(results)}/{len(results)} checks passed")
    sys.exit(0 if all(results) else 1)


if __name__ == "__main__":
    main()
