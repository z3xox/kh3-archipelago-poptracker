#!/usr/bin/env python3
"""
Headless simulation of the photographed Lucky Emblem tracking.

Reuses simulate_space.py's PopTracker mock and plays what the KH3 client and the
AP server do with the DataStorage key kh3_lucky_emblems_<team>_<slot>: the Get
answered on connect (OnNotifyLaunch) and the SetReply of each new capture
(OnNotify). Values are shaped as the client writes them: {"<global_id>": true}.

Needs `pip install lupa`.  Usage:  python scripts/tools/simulate_lucky_emblems.py
"""
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from simulate_space import Sim, load_json  # noqa: E402

KEY = "kh3_lucky_emblems_0_1"
OLYMPUS_1 = "Olympus Lucky Emblem 1 - Overlook Wall"


class EmblemSim(Sim):
    def __init__(self):
        super().__init__()
        g = self.lua.globals()
        for item in load_json("items/lucky_emblem_spots.json"):
            g.mock_add_item(self.lua.table_from(self._lua_def(item)))
        for top in load_json("locations/lucky_emblem_spots.json"):
            self._index(top, [])

    def stored(self, *ids):
        return self.lua.table_from({str(i): True for i in ids})

    def launch(self, key, *ids):
        self.lua.globals().OnNotifyLaunch(key, self.stored(*ids))

    def notify(self, key, ids, old_ids):
        self.lua.globals().OnNotify(key, self.stored(*ids), self.stored(*old_ids))

    def captured(self):
        return [i for i in range(1, 91) if self.code_count(f"lucky_emblem_spot_{i:03d}") > 0]


def main():
    results = []

    def check(label, ok):
        results.append(ok)
        print(f"  {'ok  ' if ok else 'FAIL'} {label}")

    sim = EmblemSim()
    sim.clear()
    check("connect: storage key follows team and slot",
          sim.lua.eval("LUCKY_EMBLEMS_ID") == KEY)
    check("connect: no spot captured before the server answers", sim.captured() == [])

    sim.launch(KEY, 13, 88)
    check("Get reply restores captures made while the pack was closed", sim.captured() == [13, 88])

    sim.notify(KEY, [1, 13, 88], [13, 88])
    check("SetReply adds a live capture", sim.captured() == [1, 13, 88])

    sim.notify("_read_hints_0_1", [], [])
    sim.launch("kh3_lucky_emblems_0_2", 50)
    check("other keys and other slots are ignored", sim.captured() == [1, 13, 88])

    sim.clear()
    check("reconnect clears the previous slot's captures", sim.captured() == [])

    check("Olympus spot 1 out of logic without Hero's Origin",
          not sim.accessible(OLYMPUS_1, "On a wall in Thebes Overlook."))
    sim.item("Hero's Origin", 0)
    check("Olympus spot 1 still needs Wall Run",
          not sim.accessible(OLYMPUS_1, "On a wall in Thebes Overlook."))
    sim.item("Unlock: Wall Run", 1)
    check("Olympus spot 1 in logic with Hero's Origin + Wall Run",
          sim.accessible(OLYMPUS_1, "On a wall in Thebes Overlook."))

    print(f"\n{sum(results)}/{len(results)} checks passed")
    sys.exit(0 if all(results) else 1)


if __name__ == "__main__":
    main()
