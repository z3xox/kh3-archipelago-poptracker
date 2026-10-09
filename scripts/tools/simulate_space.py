#!/usr/bin/env python3
"""
Headless simulation of the Gummi space tracking, without PopTracker or an AP server.

It loads the pack's real Lua (logic.lua, autotracking.lua, item_mapping.lua,
location_mapping.lua) in an embedded Lua VM (lupa) behind a small PopTracker mock:
items come from items/*.json, access rules from locations/*.json (comma = AND, list =
OR, "code:N" = count, "$fn|a|b" = Lua function, parent rules AND child rules).
Scenarios then play AP events (clear, items, locations, map bounce) and assert what
becomes accessible / cleared / switched.

Needs `pip install lupa`.  Usage:  python scripts/tools/simulate_space.py
"""
import json
import sys
from pathlib import Path

from lupa import LuaRuntime

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(Path(__file__).parent))

LUA_MOCK = r"""
local ITEMS = {}        -- object list
local BY_CODE = {}      -- first listed code -> object
UI_HINTS = {}

local function split(codes)
    local out = {}
    for c in string.gmatch(codes or "", "[^,%s]+") do out[#out + 1] = c end
    return out
end

function mock_add_item(def)
    local obj = { def = def, type = def.type, Active = false, AcquiredCount = def.initial_quantity or 0,
                  CurrentStage = def.initial_stage_idx or 0 }
    function obj:SetOverlay() end
    function obj:SetOverlayFontSize() end
    function obj:SetOverlayBackground() end
    ITEMS[#ITEMS + 1] = obj
    if def.type == "progressive" then
        for _, st in ipairs(def.stages) do for _, c in ipairs(split(st.codes)) do BY_CODE[c] = BY_CODE[c] or obj end end
    else
        for _, c in ipairs(split(def.codes)) do BY_CODE[c] = BY_CODE[c] or obj end
    end
end

local function provided(obj)
    local out = {}
    local def = obj.def
    if def.type == "toggle" then
        if obj.Active then for _, c in ipairs(split(def.codes)) do out[c] = 1 end end
    elseif def.type == "consumable" then
        for _, c in ipairs(split(def.codes)) do out[c] = obj.AcquiredCount end
    elseif def.type == "progressive" then
        local stages = def.stages
        local cur = obj.CurrentStage + 1
        for i, st in ipairs(stages) do
            if i == cur or (i < cur and st.inherit_codes ~= false and stages[cur].inherit_codes ~= false) then
                for _, c in ipairs(split(st.codes)) do out[c] = 1 end
            end
        end
    end
    return out
end

SECTIONS = {}  -- "@loc/sec" -> object, filled by Python
function mock_add_section(code, count)
    SECTIONS[code] = { AvailableChestCount = count, ChestCount = count }
end

Tracker = {}
function Tracker:FindObjectForCode(code)
    if string.sub(code, 1, 1) == "@" then return SECTIONS[code] end
    return BY_CODE[code]
end
function Tracker:ProviderCountForCode(code)
    local n = 0
    for _, obj in ipairs(ITEMS) do n = n + (provided(obj)[code] or 0) end
    return n
end
function Tracker:UiHint(kind, tab) UI_HINTS[#UI_HINTS + 1] = kind .. ":" .. tab end

-- PopTracker rule engine for one rule string ("a,b:2,$fn|x|y")
function eval_rule(rule)
    for raw in string.gmatch(rule, "[^,]+") do
        local term = raw:match("^%s*(.-)%s*$")
        local ok
        if string.sub(term, 1, 1) == "$" then
            local parts = {}
            for p in string.gmatch(term:sub(2), "[^|]+") do parts[#parts + 1] = p end
            local fn = _G[parts[1]]
            assert(fn, "unknown rule function " .. parts[1])
            local r = fn(table.unpack(parts, 2))
            ok = (r == true) or (type(r) == "number" and r > 0)
        else
            local code, need = term:match("^(.-):(%d+)$")
            if not code then code, need = term, 1 end
            ok = Tracker:ProviderCountForCode(code) >= tonumber(need)
        end
        if not ok then return false end
    end
    return true
end

Archipelago = { PlayerNumber = 1, TeamNumber = 0 }
function Archipelago:AddClearHandler() end
function Archipelago:AddItemHandler() end
function Archipelago:AddLocationHandler() end
function Archipelago:AddSetReplyHandler() end
function Archipelago:AddRetrievedHandler() end
function Archipelago:AddBouncedHandler() end
function Archipelago:SetNotify() end
function Archipelago:Get() end

ScriptHost = {}
function ScriptHost:LoadScript(path) dofile(ROOT .. "/" .. path) end
-- PopTracker calls these when the watched code changes; tests fire them by hand.
WATCHES = {}  -- code -> callback
function ScriptHost:AddWatchForCode(name, code, fn) WATCHES[code] = fn end
"""


def load_json(rel):
    return json.loads((ROOT / rel).read_bytes().decode("utf-8"))


class Sim:
    def __init__(self):
        self.lua = LuaRuntime(unpack_returned_tuples=True)
        self.lua.execute(f"ROOT = {json.dumps(str(ROOT).replace(chr(92), '/'))}")
        self.lua.execute(LUA_MOCK)
        g = self.lua.globals()
        for rel in ("items/items.json", "items/settings.json"):
            for item in load_json(rel):
                g.mock_add_item(self.lua.table_from(self._lua_def(item)))
        self.tree = []
        self.codes = {}  # "@loc/sec" -> (rules chain, item_count)
        for rel in ("locations/space.json", "locations/overworld.json"):
            for top in load_json(rel):
                self._index(top, [])
        for code, (_, count) in self.codes.items():
            g.mock_add_section(code, count)
        self.lua.execute('dofile(ROOT .. "/scripts/logic.lua")')
        self.lua.execute('ScriptHost:LoadScript("scripts/autotracking/autotracking.lua")')

    def _lua_def(self, item):
        d = {k: v for k, v in item.items() if k != "stages"}
        if "stages" in item:
            d["stages"] = self.lua.table_from([self.lua.table_from(s) for s in item["stages"]])
        return d

    def _index(self, node, chain):
        chain = chain + [node.get("access_rules", [])]
        for sec in node.get("sections", []):
            if "ref" in sec:
                # An Overworld mirror: PopTracker shares state through "ref", but the pack also
                # clears it explicitly (OVERWORLD_SECTION_MAP), which is what we exercise.
                self.codes[f"@{node['name']}/{sec['name']}"] = ([], 1)
                continue
            self.codes[f"@{node['name']}/{sec['name']}"] = (chain + [sec.get("access_rules", [])],
                                                              sec.get("item_count", 1))
        for child in node.get("children", []):
            self._index(child, chain)

    # --- rule evaluation -------------------------------------------------
    def accessible(self, location, section):
        chain, _ = self.codes[f"@{location}/{section}"]
        ev = self.lua.globals().eval_rule
        return all(not rules or any(ev(r) for r in rules) for rules in chain)

    # --- AP events -------------------------------------------------------
    def clear(self, **slot_data):
        self.lua.globals().onClear(self.lua.table_from(slot_data))

    def item(self, name, index):
        self.lua.globals().onItem(index, 0, name, 1)

    def location(self, ap_id):
        self.lua.globals().onLocation(ap_id, "")

    def code_count(self, code):
        return self.lua.eval(f'Tracker:ProviderCountForCode("{code}")')

    def section_left(self, location, section):
        return self.lua.eval(f'SECTIONS["@{location}/{section}"].AvailableChestCount')

    def bounce(self, **data):
        data["kh3_tracker_event"] = "map_changed"
        msg = self.lua.table_from({"data": self.lua.table_from(data)})
        self.lua.execute("UI_HINTS = {}")
        self.lua.globals().onKH3MapChanged(msg)
        return list(self.lua.eval("UI_HINTS").values())


SW = "Gummi Special Weapon: "
BP = "Gummi Blueprint: "
SLW, MST, ECL = "Space - Starlight Way", "Space - Misty Stream", "Space - The Eclipse"


def main():
    results = []

    def check(label, ok):
        results.append((label, bool(ok)))
        print(("PASS " if ok else "FAIL ") + label)

    # location ids by raw section name
    ids = {r["name"]: r["ap_id"] for r in load_json("scripts/tools/extracted_locations.json")["space_locations"]}
    sim = Sim()
    idx = iter(range(1, 1000))

    A = f"{SLW} - A (Countdown 1)"
    A_sec = f"{SLW} - Battle 01 - Countdown 1"
    schwarz = f"{MST} - Q (Schwarzgeist)"
    schwarz_sec = "Space - Schwarzgeist - Reward 1"
    miss = "Space - Missions"

    # 1. include_space off: nothing is active
    sim.clear(include_space=0)
    check("setting off: active_space is not provided", sim.code_count("active_space") == 0)
    sim.item(BP + "Golden Highwind", next(idx))
    check("setting off: Starlight check stays inaccessible", not sim.accessible(A, A_sec))

    # 2. include_space on, fresh slot
    sim.clear(include_space=1)
    check("setting on: active_space is provided", sim.code_count("active_space") == 1)
    check("no ship yet: Starlight check inaccessible", not sim.accessible(A, A_sec))
    check("no ship yet: global missions inaccessible", not sim.accessible(miss, "Space - Heartless Hunter"))

    # 3. only the two travel blueprints of a zone open it (Space.ZONE_UNLOCK_BLUEPRINTS)
    sim.item(BP + "Necho Cat", next(idx))
    check("Necho Cat opens no zone", sim.code_count("space_starlight_way") == 0
          and not sim.accessible(A, A_sec))
    check("Pro Builder needs Starlight Way",
          not sim.accessible(f"{SLW} - Missions", "Space - Pro Builder"))
    sim.item(BP + "Golden Highwind", next(idx))
    check("Starlight ship counter = 1", sim.code_count("space_starlight_way") == 1)
    check("Starlight ship: Starlight check accessible", sim.accessible(A, A_sec))
    check("Starlight ship: Misty check still inaccessible",
          not sim.accessible(f"{MST} - A (Countdown 5)", f"{MST} - Battle 01 - Countdown 5"))
    check("Starlight ship: Pro Builder accessible", sim.accessible(f"{SLW} - Missions", "Space - Pro Builder"))
    check("any ship: global missions accessible", sim.accessible(miss, "Space - Heartless Hunter"))
    check("1 zone: Junior Treasure Hunter ok", sim.accessible(miss, "Space - Junior Treasure Hunter"))
    check("1 zone: Chief Treasure Hunter (2 zones) not ok",
          not sim.accessible(miss, "Space - Chief Treasure Hunter"))
    check("no Endymion: Schwarzgeist reward inaccessible", not sim.accessible(schwarz, schwarz_sec))

    # 4. Endymion: counts for Misty Stream and its own toggle
    sim.item(BP + "Endymion", next(idx))
    check("Endymion: Misty counter = 1", sim.code_count("space_misty_stream") == 1)
    check("Endymion: gummi_endymion toggle on", sim.code_count("gummi_endymion") == 1)
    check("Endymion: Schwarzgeist reward accessible", sim.accessible(schwarz, schwarz_sec))
    check("2 zones: Chief Treasure Hunter ok", sim.accessible(miss, "Space - Chief Treasure Hunter"))
    check("2 zones: Veteran Treasure Hunter (3 zones) not ok",
          not sim.accessible(miss, "Space - Veteran Treasure Hunter"))

    # 5. special weapons (no keyblades => no Trinity Fire / Decoy Duckies)
    for n, name in enumerate(["Repair Kit", "Force Field", "Heavy Rocket"]):
        sim.item(SW + name, next(idx))
    check("3 weapons counted", sim.code_count("space_special_weapon") == 3)
    check("3 weapons: Dabbler (3) ok", sim.accessible(miss, "Space - Special Weapon Dabbler"))
    check("3 weapons: Collector (5) not ok", not sim.accessible(miss, "Space - Special Weapon Collector"))
    for name in ["Twin Shot", "Firestorm"]:
        sim.item(SW + name, next(idx))
    check("5 weapons: Collector (5) ok", sim.accessible(miss, "Space - Special Weapon Collector"))
    check("5 weapons: Completionist not ok", not sim.accessible(miss, "Space - Gummi Ship Completionist"))

    # 6. Twilight Town arrival counts as a weapon (Trinity Fire): needs 3 tier-one keyblades + combat
    mapping = {"Hero's Origin": "kb_heros_origin", "Favorite Deputy": "kb_favorite_deputy",
               "Ever After": "kb_ever_after", "Shooting Star": "kb_shooting_star"}
    for name in mapping:
        sim.item(name, next(idx))
    sim.item("Ability: Block", next(idx))
    check("TT reachable adds a weapon: 5 owned + 1 = Hoarder (7) still not ok",
          not sim.accessible(miss, "Space - Special Weapon Hoarder"))
    sim.item(SW + "Laser Squall", next(idx))
    check("6 owned + Trinity Fire = Hoarder (7) ok", sim.accessible(miss, "Space - Special Weapon Hoarder"))

    # 7. location checks clear both the detail section and its overworld mirror
    ap_id = ids[A_sec]
    check("before: section has 1 item left", sim.section_left(A, A_sec) == 1)
    sim.location(ap_id)
    check("after onLocation: detail section cleared", sim.section_left(A, A_sec) == 0)
    check("after onLocation: overworld mirror cleared",
          sim.section_left("Gummi Space - Starlight Way - All Checks", A_sec) == 0)

    # 8. optional checks follow their seed options
    sim.clear(include_space=1, include_grindy_space_missions=1, include_space_superbosses=0)
    check("grindy missions setting follows slot_data", sim.code_count("active_space_grindy") == 1
          and sim.code_count("active_space_superbosses") == 0)

    # 8b. reconnect resets state
    sim.clear(include_space=1)
    check("onClear resets ship counters", sim.code_count("space_starlight_way") == 0)
    check("onClear resets Endymion", sim.code_count("gummi_endymion") == 0)
    check("onClear resets weapons", sim.code_count("space_special_weapon") == 0)

    # 9. completionist needs everything
    sim.clear(include_space=1)
    n = next(idx)
    for name in ["Golden Highwind", "Sirius", "Endymion"]:
        sim.item(BP + name, n); n = next(idx)
    for w in ["Repair Kit", "Force Field", "Heavy Rocket", "Twin Shot", "Firestorm", "Laser Squall",
              "Sunlight Laser", "Barrier", "Tracking Laser", "Electro Shot", "Knight's Arms"]:
        sim.item(SW + w, n); n = next(idx)
    check("all ships+weapons but no worlds: Completionist not ok",
          not sim.accessible(miss, "Space - Gummi Ship Completionist"))
    for kb in ["kb_heros_origin", "kb_shooting_star", "kb_favorite_deputy", "kb_ever_after", "kb_crystal_snow",
               "kb_happy_gear", "kb_nano_gear", "kb_wheel_of_fate", "kb_starlight"]:
        sim.lua.execute(f'Tracker:FindObjectForCode("{kb}").Active = true')
    for code in ["ability_block", "ability_air_slide"]:
        sim.lua.execute(f'Tracker:FindObjectForCode("{code}").Active = true')
    check("all worlds but Monstropolis finale (Decoy Duckies) unfinished: Completionist not ok",
          not sim.accessible(miss, "Space - Gummi Ship Completionist"))
    # Monstropolis' finale needs its own route of abilities (COLISEUM_WORLD_COMPLETION)
    for code in ["ability_doubleflight", "ability_superjump", "ability_wall_kick", "unlock_magic"]:
        sim.lua.execute(f'Tracker:FindObjectForCode("{code}").Active = true')
    check("everything: Completionist ok", sim.accessible(miss, "Space - Gummi Ship Completionist"))

    # 10. auto-follow
    check("map bounce gm_02 -> Gummi Space + Misty Stream tabs",
          sim.bounce(kh3_world_code="gm", kh3_room_id="gm_02", kh3_level_id="gm_02")
          == ["ActivateTab:Gummi Space", "ActivateTab:Misty Stream"])
    check("map bounce gm_03 -> The Eclipse tab",
          sim.bounce(kh3_world_code="gm", kh3_room_id="gm_03")[-1] == "ActivateTab:The Eclipse")
    check("map bounce gm_50 (cutscene) -> only the Gummi Space tab",
          sim.bounce(kh3_world_code="gm", kh3_room_id="gm_50") == ["ActivateTab:Gummi Space"])

    failed = [label for label, ok in results if not ok]
    print(f"\n{len(results) - len(failed)}/{len(results)} checks passed")
    sys.exit(1 if failed else 0)


if __name__ == "__main__":
    main()
