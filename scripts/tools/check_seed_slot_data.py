#!/usr/bin/env python3
"""
Check the pack against the slot_data of a real generated seed.

Feeds the seed's slot_data to the pack's onClear in simulate_space.py's PopTracker
mock, then reports:
  - the seed's checks (location_catalog.entries) that have no entry in
    location_mapping.lua -- the pack cannot show or autotrack them;
  - what the pack detected from the slot_data (settings, Chestsanity keyblades,
    Song Bonuses, Melody of Memory songs and chests), next to what the seed holds.
Exits 1 when a check of the seed is unknown to the pack.

The slot_data comes from a seed generated with the apworld (any Archipelago
checkout with worlds/kh3; Generate.py writes out/AP_<seed>.zip). From that
checkout's root:

    python -c "import glob, json, zipfile, zlib, Utils; z = zipfile.ZipFile(glob.glob('out/AP_*.zip')[0]); \\
    raw = z.read([n for n in z.namelist() if n.endswith('.archipelago')][0]); \\
    md = Utils.restricted_loads(zlib.decompress(raw[1:])); \\
    json.dump(md['slot_data'][1], open('slot_data.json', 'w'), default=str)"

Needs `pip install lupa`.  Usage:  python scripts/tools/check_seed_slot_data.py slot_data.json
"""
import json
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from simulate_space import ROOT, Sim, load_json  # noqa: E402

MOM_BASE = 1263153920
MELODY_CHESTS = {1263154177 + i: code for i, code in enumerate((
    "mc_chest_olympus", "mc_chest_twilight_town", "mc_chest_monstropolis", "mc_chest_kingdom_of_corona",
    "mc_chest_the_caribbean", "mc_chest_toy_box", "mc_chest_san_fransokyo", "mc_chest_arendelle"))}
SONG_BONUS_MIN, SONG_BONUS_MAX = 1263022848 + 0x100000, 1263022848 + 0x200000
SETTINGS = ("portal_party", "active_chestsanity", "active_space", "active_space_grindy",
            "active_space_superbosses", "active_lucky_emblems", "active_battlegates", "active_level_ups",
            "active_ingredients", "active_ingredients_plus", "le_limit", "lu_limit", "mc_limit", "lep_check")


def main():
    if len(sys.argv) != 2:
        sys.exit(__doc__)
    slot_data = json.loads(Path(sys.argv[1]).read_text(encoding="utf-8"))
    entries = slot_data["location_catalog"]["entries"]
    ids = [entry[0] for entry in entries]

    mapping = (ROOT / "scripts/autotracking/location_mapping.lua").read_text(encoding="utf-8")
    mapped = {int(i) for i in re.findall(r"\[(\d+)\]\s*=\s*\{", mapping)}
    unknown = [i for i in ids if i not in mapped]

    sim = Sim()
    for rel in ("items/melody_of_memory.json", "items/lucky_emblem_spots.json"):
        for item in load_json(rel):
            sim.lua.globals().mock_add_item(sim.lua.table_from(sim._lua_def(item)))

    def lua(value):
        if isinstance(value, dict):
            return sim.lua.table_from({k: lua(v) for k, v in value.items()})
        if isinstance(value, list):
            return sim.lua.table_from([lua(v) for v in value])
        return value

    sim.lua.globals().onClear(lua(slot_data))
    count = sim.code_count
    lua_size = "(function(t) local n = 0 for _ in pairs(t) do n = n + 1 end return n end)"

    songs = [i - MOM_BASE for i in ids if MOM_BASE <= i < MOM_BASE + 256]
    chests = [MELODY_CHESTS[i] for i in ids if i in MELODY_CHESTS]
    foreign = sum(1 for e in entries if e[2].get("keyblade_chest_keyblade") and not e[2].get("keyblade_chest_native"))
    rows = [
        ("Chestsanity foreign keyblades", foreign, sim.lua.eval(f"{lua_size}(CHEST_KEYBLADE)")),
        ("Song Bonuses", sum(SONG_BONUS_MIN <= i < SONG_BONUS_MAX for i in ids),
         sim.lua.eval(f"{lua_size}(SONG_BONUS)")),
        ("Melody of Memory songs", len(songs), sum(count(f"mom_song_{s}") > 0 for s in songs)),
        ("Melody Chests", len(chests), sum(count(c) > 0 for c in chests)),
    ]
    print(f"\n{len(ids)} checks in the seed, {len(unknown)} unknown to the pack")
    for i in unknown[:20]:
        print(f"  unknown: {i}")
    print(f"\n{'':32}{'seed':>6}{'pack':>6}")
    for label, seed, pack in rows:
        print(f"{label:32}{seed:>6}{pack:>6}{'' if seed == pack else '   <- differs'}")
    print()
    for code in SETTINGS:
        print(f"{code:32}{count(code):>12}")
    sys.exit(1 if unknown or any(seed != pack for _, seed, pack in rows) else 0)


if __name__ == "__main__":
    main()
