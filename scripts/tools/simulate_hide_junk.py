#!/usr/bin/env python3
"""
Headless simulation of the "Hide Junk Checks" setting.

Reuses simulate_space.py's PopTracker mock. A pool set to junk keeps its checks
in the seed but only holds filler or traps; with Hide Junk Checks on, the
pool's setting is switched off like a vanilla pool, which hides its checks
(their active_* code goes away). Toggling the setting after connecting
re-applies the seed's pool modes (the hide_junk_setting watch).

Needs `pip install lupa`.  Usage:  python scripts/tools/simulate_hide_junk.py
"""
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from simulate_space import Sim  # noqa: E402

RANDOMIZE, JUNK, VANILLA = 2, 3, 1


def main():
    results = []

    def check(label, ok):
        results.append(ok)
        print(f"  {'ok  ' if ok else 'FAIL'} {label}")

    sim = Sim()
    lua = sim.lua

    def connect():
        pools = lua.table_from({"Lucky Emblems": JUNK, "Olympus": RANDOMIZE, "Arendelle": JUNK})
        sim.clear(kh3_randomizer=lua.table_from({"pools": pools}),
                  photo_missions_pool=JUNK, synthesis_pool=RANDOMIZE, keyblade_upgrade_rewards_pool=VANILLA)

    def set_hide(on):
        lua.execute(f'Tracker:FindObjectForCode("hide_junk_setting").CurrentStage = {1 if on else 0}')
        lua.execute('WATCHES["hide_junk_setting"]("hide_junk_setting")')

    def active(code):
        return sim.code_count(code) > 0

    # 1. default: junk pools stay visible
    connect()
    check("off: junk Lucky Emblems shown", active("active_lucky_emblems"))
    check("off: junk Arendelle shown", active("active_arendelle"))
    check("off: junk Photo Missions shown", active("active_photo_missions"))
    check("off: vanilla Keyblade Upgrades hidden", not active("active_keyblade_upgrades"))

    # 2. toggled on after connecting: the watch re-applies the seed's pools
    set_hide(True)
    check("on: junk Lucky Emblems hidden", not active("active_lucky_emblems"))
    check("on: junk Arendelle hidden", not active("active_arendelle"))
    check("on: junk Photo Missions hidden", not active("active_photo_missions"))
    check("on: randomized Olympus still shown", active("active_olympus"))
    check("on: randomized Synthesis still shown", active("active_synthesis"))
    check("on: pool absent from slot_data (randomize) still shown", active("active_toy_box"))

    # 3. reconnecting keeps the choice
    connect()
    check("reconnect: junk Lucky Emblems still hidden", not active("active_lucky_emblems"))

    # 4. toggled back off
    set_hide(False)
    check("off again: junk Lucky Emblems shown", active("active_lucky_emblems"))
    check("off again: vanilla Keyblade Upgrades still hidden", not active("active_keyblade_upgrades"))

    print(f"\n{sum(results)}/{len(results)} checks passed")
    sys.exit(0 if all(results) else 1)


if __name__ == "__main__":
    main()
