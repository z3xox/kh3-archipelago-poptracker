#!/usr/bin/env python3
"""
Headless simulation of the extra victory bonus rewards ("<parent> - Reward 2/3").

Reuses simulate_space.py's PopTracker mock with the Olympus events: the two extra
sections open with their parent and are cleared, with their Overworld mirror, by
their own AP location id.

Needs `pip install lupa`.  Usage:  python scripts/tools/simulate_extra_vbonus.py
"""
import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from simulate_space import Sim, load_json  # noqa: E402

LOC = "Olympus - Mount Olympus: Cliff Ascent Heartless"


class ExtraSim(Sim):
    def __init__(self):
        super().__init__()
        known = set(self.codes)
        for rel in ("locations/olympus_events.json", "locations/overworld.json"):
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

    extras = {r["name"]: r["ap_id"] for r in load_json("scripts/tools/extracted_locations.json")["extra_vbonus_locations"]}
    sim = ExtraSim()
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

    print(f"\n{sum(results)}/{len(results)} checks passed")
    sys.exit(0 if all(results) else 1)


if __name__ == "__main__":
    main()
