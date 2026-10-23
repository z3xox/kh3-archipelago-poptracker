-- Logic functions, used in access rules as $function_name

-- ============================================================
-- Goal display (Proofs vs Heart Pieces)
-- ============================================================

function update_goal_layout()
    local goal_obj = Tracker:FindObjectForCode("goal")
    if goal_obj and goal_obj.CurrentStage == 1 then
        Tracker:AddLayouts("layouts/goal_heart_pieces.json")
    else
        Tracker:AddLayouts("layouts/goal_proofs.json")
    end
end

-- Stylesanity on: per-keyblade Style Change unlocks instead of the shared one.
STYLE_CHANGE_KEYBLADE_SANITY = 1

-- Keyblade Levels: 0 = start at max, 1 = shuffled (shared counter),
-- 2 = keyblade upgrade sanity (one counter per keyblade).
KEYBLADE_LEVELS_SHUFFLED = 1
KEYBLADE_LEVELS_PER_KEYBLADE = 2

local function keyblade_levels_mode()
    local obj = Tracker:FindObjectForCode("keyblade_levels_setting")
    return obj and obj.CurrentStage or 0
end

function update_gimmick_layout()
    local obj = Tracker:FindObjectForCode("style_change_setting")
    local style_sanity = obj and obj.CurrentStage == STYLE_CHANGE_KEYBLADE_SANITY
    local with_level_counter = keyblade_levels_mode() == KEYBLADE_LEVELS_SHUFFLED
    if style_sanity then
        Tracker:AddLayouts(with_level_counter and "layouts/gimmick_stylesanity_levels.json"
                           or "layouts/gimmick_stylesanity.json")
    else
        Tracker:AddLayouts(with_level_counter and "layouts/gimmick_shared_levels.json"
                           or "layouts/gimmick_shared.json")
    end
end

-- Groups hidden when their setting is off: {layout key, setting, code}.
OPTION_GROUPS = {
    {"group_party_members", "portal_unlocks_setting", "portal_party"},
    {"group_gummi_space", "space_setting", "active_space"},
}

function update_option_groups()
    for _, group in ipairs(OPTION_GROUPS) do
        local shown = Tracker:ProviderCountForCode(group[3]) > 0
        Tracker:AddLayouts("layouts/" .. group[1] .. (shown and ".json" or "_hidden.json"))
    end
end

-- Keyblade upgrade sanity adds a row for Pandora's Power and Ultima Weapon levels.
function update_keyblades_layout()
    if keyblade_levels_mode() == KEYBLADE_LEVELS_PER_KEYBLADE then
        Tracker:AddLayouts("layouts/keyblades_levels.json")
    else
        Tracker:AddLayouts("layouts/keyblades.json")
    end
end

-- Keyblades with a Moogle Workshop upgrade check.
KEYBLADE_LEVEL_KEYBLADES = {
    "kingdom_key", "kb_shooting_star", "kb_heros_origin", "kb_favorite_deputy", "kb_ever_after",
    "kb_wheel_of_fate", "kb_crystal_snow", "kb_hunny_spout", "kb_nano_gear", "kb_happy_gear",
    "kb_classic_tone", "kb_grand_chef", "kb_starlight", "kb_oathkeeper", "kb_oblivion",
}

-- A keyblade starts at level 0 and gains one level per level item.
function keyblade_display_level(items)
    return items or 0
end

-- "kb_ever_after" -> "lvl_ever_after", "kingdom_key" -> "lvl_kingdom_key"
local function keyblade_level_counter(keyblade_code)
    return "lvl_" .. (keyblade_code:gsub("^kb_", ""))
end

function update_keyblade_level_overlays()
    local per_keyblade = keyblade_levels_mode() == KEYBLADE_LEVELS_PER_KEYBLADE
    for _, code in ipairs(KEYBLADE_LEVEL_KEYBLADES) do
        local keyblade = Tracker:FindObjectForCode(code)
        if keyblade then
            if per_keyblade and keyblade.Active then
                local counter = Tracker:FindObjectForCode(keyblade_level_counter(code))
                keyblade:SetOverlay(tostring(keyblade_display_level(counter and counter.AcquiredCount)))
                keyblade:SetOverlayFontSize(11)
            else
                keyblade:SetOverlay("")
            end
        end
    end
end

-- Minigame rank settings share one icon: overlay "<minigame> <rank>".
MINIGAME_RANK_SETTINGS = {
    {"verum_rex_rank",      "VR"},
    {"festival_dance_rank", "FD"},
    {"frozen_slider_rank",  "FS"},
    {"flash_tracer_a_rank", "FTA"},
    {"flash_tracer_b_rank", "FTB"},
}
local MINIGAME_RANK_LETTERS = {"J", "D", "C", "B", "A"}

function update_minigame_rank_overlays()
    for _, entry in ipairs(MINIGAME_RANK_SETTINGS) do
        local obj = Tracker:FindObjectForCode(entry[1])
        if obj then
            obj:SetOverlay(entry[2] .. " " .. (MINIGAME_RANK_LETTERS[obj.CurrentStage + 1] or "?"))
            obj:SetOverlayFontSize(11)
        end
    end
end

-- ============================================================
-- Portal keyblades / world tiers
-- ============================================================

-- Tier-one portal keyblades (100 Acre Wood has none).
TIER_ONE_KEYBLADE_CODES = {
    "kb_heros_origin",     -- Olympus
    "kb_favorite_deputy",  -- Toy Box
    "kb_happy_gear",       -- Monstropolis
    "kb_ever_after",       -- Kingdom of Corona
    "kb_wheel_of_fate",    -- The Caribbean
    "kb_crystal_snow",     -- Arendelle
    "kb_nano_gear",        -- San Fransokyo
}

TIER_ONE_KEYBLADE_REQUIRED = 3

local function hasCode(code)
    if not code then return false end
    return Tracker:ProviderCountForCode(code) > 0
end

local function countCodes(codes)
    local count = 0
    for _, code in ipairs(codes) do
        if hasCode(code) then count = count + 1 end
    end
    return count
end

-- Portal Unlocks = Party Members: the character opening each keyblade's world.
PORTAL_PARTY_BY_KEYBLADE = {
    kb_heros_origin    = {"party_hercules"},
    kb_favorite_deputy = {"party_woody"},
    kb_ever_after      = {"party_rapunzel"},
    kb_happy_gear      = {"party_sulley"},
    kb_wheel_of_fate   = {"party_captain_jack_sparrow"},
    kb_nano_gear       = {"party_baymax"},
    kb_crystal_snow    = {"party_marshmallow"},
    kb_shooting_star   = {"party_roxas"},
    kb_oblivion        = {"party_aqua"},
    kb_starlight       = {"party_ventus"},
    kingdom_key        = {"party_kairi"},
    kb_oathkeeper      = {"party_riku"},
}

local function portalOpen(keyblade)
    if hasCode("portal_party") then
        local party = PORTAL_PARTY_BY_KEYBLADE[keyblade]
        return party ~= nil and countCodes(party) > 0
    end
    return hasCode(keyblade)
end

-- $portal|<keyblade>
function portal(keyblade)
    if portalOpen(keyblade) then return 1 end
    return 0
end

-- $any_portal|<keyblade>|...
function any_portal(...)
    for _, keyblade in ipairs({...}) do
        if portalOpen(keyblade) then return 1 end
    end
    return 0
end

-- Chestsanity: AP location id -> keyblade code, from slot_data.
CHEST_KEYBLADE = {}

-- $chest_keyblade|<AP location id>
function chest_keyblade(location_id)
    local keyblade = CHEST_KEYBLADE[tonumber(location_id)]
    if keyblade == nil or hasCode(keyblade) then return 1 end
    return 0
end

-- Song Bonuses of the seed: AP location id -> true, from slot_data.
SONG_BONUS = {}

-- $song_bonus|<AP location id> (visibility; "Show All" setting when offline)
function song_bonus(location_id)
    if SONG_BONUS[tonumber(location_id)] or hasCode("song_bonus_all") then return 1 end
    return 0
end

-- World pools set to junk: pool name -> true, from slot_data.
JUNK_WORLD_POOLS = {}

-- $photo_mission_shown|<World>|... (visibility: no photo mission for a junk world)
function photo_mission_shown(...)
    for _, world in ipairs({...}) do
        if JUNK_WORLD_POOLS[world] then return 0 end
    end
    return 1
end

-- Melody of Memory: song id -> code of the music chest it opens, from slot_data.
MOM_SONG_CHEST = {}

-- $mom_song_open|<song id>: in logic when its chest is.
function mom_song_open(song_id)
    local code = MOM_SONG_CHEST[tonumber(song_id)]
    local chest = code and Tracker:FindObjectForCode(code)
    if not chest then return 0 end
    local normal = AccessibilityLevel and AccessibilityLevel.Normal or 6
    if (chest.AccessibilityLevel or 0) >= normal then return 1 end
    return 0
end

-- $any_mom_song (visibility): the seed has at least one Melody of Memory song.
-- Song ids stay below 256.
function any_mom_song()
    for song_id = 0, 255 do
        if hasCode("mom_song_" .. song_id) then return 1 end
    end
    return 0
end

-- Open tier-one worlds (keyblades, or characters with party portals).
function count_tier_one_keyblades()
    local count = 0
    for _, keyblade in ipairs(TIER_ONE_KEYBLADE_CODES) do
        if portalOpen(keyblade) then count = count + 1 end
    end
    return count
end

function has_tier_one_keyblades()
    if count_tier_one_keyblades() >= TIER_ONE_KEYBLADE_REQUIRED then return 1 end
    return 0
end

-- Twilight Town also needs Block, Air Slide or Dodge Roll.
DEFENSIVE_CODES = {"ability_block", "ability_air_slide", "ability_dodge_roll"}

function has_twilight_town_combat()
    if countCodes(DEFENSIVE_CODES) >= 1 then return 1 end
    return 0
end

function has_any_two_defensive()
    return has_twilight_town_combat()
end

-- The Caribbean also needs Air Slide, Dodge Roll, Glide or Blizzard (+ Magic).
CARIBBEAN_SAFETY_TOOL_CODES = {"ability_air_slide", "ability_dodge_roll", "ability_glide"}

local function hasCaribbeanSafetyTool()
    if countCodes(CARIBBEAN_SAFETY_TOOL_CODES) >= 1 then return true end
    return hasCode("blizzard") and hasCode("unlock_magic")
end

function has_caribbean_safety_tool()
    if hasCaribbeanSafetyTool() then return 1 end
    return 0
end

-- $keyblade_upgrade|<keyblade code>|<level>
function keyblade_upgrade(keyblade_code, level)
    if not hasCode(keyblade_code) then return 0 end
    local mode = keyblade_levels_mode()
    if mode == 0 then return 1 end
    local counter = (mode == KEYBLADE_LEVELS_SHUFFLED) and "lvl_shared" or keyblade_level_counter(keyblade_code)
    if Tracker:ProviderCountForCode(counter) >= (tonumber(level) or 1) then return 1 end
    return 0
end

-- $has_any|code|...
function has_any(...)
    local codes = {...}
    for _, code in ipairs(codes) do
        if hasCode(code) then return 1 end
    end
    return 0
end

-- $has_at_least|N|code|...
function has_at_least(...)
    local args = {...}
    local needed = tonumber(args[1]) or 1
    local count = 0
    for i = 2, #args do
        if hasCode(args[i]) then count = count + 1 end
    end
    if count >= needed then return 1 end
    return 0
end

-- ============================================================
-- Requirement route evaluation
-- ============================================================

-- A route is a list of clauses {codes={...}, count=N}, all required.
local function routeSatisfied(route)
    for _, clause in ipairs(route) do
        if countCodes(clause.codes) < clause.count then
            return false
        end
    end
    return true
end

-- Any one route is enough; no route means no requirement.
local function anyRouteSatisfied(routes)
    if routes == nil or #routes == 0 then return true end
    for _, route in ipairs(routes) do
        if routeSatisfied(route) then return true end
    end
    return false
end

-- ============================================================
-- World reachability
-- ============================================================

-- Worlds that also need three tier-one worlds open.
TIER_GATED_WORLDS = {
    ["Data Battles"] = true,
}

local function worldReachable(world, keyblade)
    if keyblade and not portalOpen(keyblade) then return false end
    if TIER_GATED_WORLDS[world] and count_tier_one_keyblades() < TIER_ONE_KEYBLADE_REQUIRED then
        return false
    end
    if world == "Twilight Town" and countCodes(DEFENSIVE_CODES) < 1 then
        return false
    end
    if world == "Keyblade Graveyard" and not hasCode("unlock_attraction_flow") then
        return false
    end
    if world == "The Caribbean" and not hasCaribbeanSafetyTool() then
        return false
    end
    return true
end

WORLD_PORTAL_KEYBLADES = {
    ["Olympus"]            = "kb_heros_origin",
    ["Twilight Town"]      = "kb_shooting_star",
    ["Toy Box"]            = "kb_favorite_deputy",
    ["Kingdom of Corona"]  = "kb_ever_after",
    ["Monstropolis"]       = "kb_happy_gear",
    ["Arendelle"]          = "kb_crystal_snow",
    ["San Fransokyo"]      = "kb_nano_gear",
    ["The Caribbean"]      = "kb_wheel_of_fate",
    ["Keyblade Graveyard"] = "kb_starlight",
    ["Re Mind"]            = "kingdom_key",
    ["Dark World"]         = "kb_oblivion",
}

-- $can_reach_any_world|<World>|...
function can_reach_any_world(...)
    for _, world in ipairs({...}) do
        if worldReachable(world, WORLD_PORTAL_KEYBLADES[world]) then return 1 end
    end
    return 0
end

-- ============================================================
-- Level Ups
-- ============================================================

-- Worlds that give XP
XP_SOURCE_WORLDS = {
    {world = "The Caribbean",     keyblade = "kb_wheel_of_fate"},
    {world = "Arendelle",         keyblade = "kb_crystal_snow"},
    {world = "Kingdom of Corona", keyblade = "kb_ever_after"},
    {world = "San Fransokyo",     keyblade = "kb_nano_gear"},
    {world = "Monstropolis",      keyblade = "kb_happy_gear"},
    {world = "Toy Box",           keyblade = "kb_favorite_deputy"},
    {world = "Twilight Town",     keyblade = "kb_shooting_star"},
}

-- Highest level reachable with 1, 2, ... XP worlds
LEVEL_CAPS = {3, 5, 8, 12, 15, 19, 22}

function count_reachable_xp_sources()
    local count = 0
    for _, entry in ipairs(XP_SOURCE_WORLDS) do
        if worldReachable(entry.world, entry.keyblade) then
            count = count + 1
        end
    end
    return count
end

function required_xp_sources_for_level(level)
    local total = #XP_SOURCE_WORLDS
    if level < 2 then return total end
    for required, cap in ipairs(LEVEL_CAPS) do
        if level <= cap then return required end
    end
    return total
end

-- $can_reach_level|N
function can_reach_level(level)
    level = tonumber(level) or 0
    if count_reachable_xp_sources() >= required_xp_sources_for_level(level) then
        return 1
    end
    return 0
end

-- $can_reach_level_gate|N: red only while the previous level is out of reach,
-- yellow (via [$can_reach_level|N]) until this one is in logic.
function can_reach_level_gate(level)
    level = tonumber(level) or 0
    local prev = level - 1
    if prev < 2 then prev = 2 end
    return can_reach_level(prev)
end

-- ============================================================
-- Lucky Emblems
-- ============================================================

-- One entry per photographable spot, by global id
LUCKY_EMBLEM_SPOTS = {
    {world="Olympus",keyblade="kb_heros_origin",routes={{{codes={"unlock_wall_run"},count=1}},{{codes={"ability_superjump"},count=1},{codes={"ability_wall_kick"},count=1},{codes={"ability_air_slide"},count=1}}}},
    {world="Olympus",keyblade="kb_heros_origin",routes={{{codes={"unlock_wall_run"},count=1}},{{codes={"ability_superjump"},count=1},{codes={"ability_wall_kick"},count=1},{codes={"ability_air_slide"},count=1}}}},
    {world="Olympus",keyblade="kb_heros_origin",routes={{{codes={"unlock_wall_run"},count=1}},{{codes={"ability_superjump"},count=1},{codes={"ability_wall_kick"},count=1},{codes={"ability_air_slide"},count=1}}}},
    {world="Olympus",keyblade="kb_heros_origin",routes={{{codes={"unlock_wall_run"},count=1}}}},
    {world="Olympus",keyblade="kb_heros_origin",routes={{{codes={"unlock_wall_run"},count=1}},{{codes={"ability_superjump"},count=1},{codes={"ability_wall_kick"},count=1},{codes={"ability_air_slide"},count=1},{codes={"ability_doubleflight"},count=1}}}},
    {world="Olympus",keyblade="kb_heros_origin",routes={{{codes={"unlock_wall_run"},count=1}},{{codes={"ability_superjump"},count=1},{codes={"ability_wall_kick"},count=1},{codes={"ability_air_slide"},count=1},{codes={"ability_doubleflight"},count=1}}}},
    {world="Olympus",keyblade="kb_heros_origin",routes={{{codes={"unlock_wall_run"},count=1}},{{codes={"ability_superjump"},count=1},{codes={"ability_wall_kick"},count=1},{codes={"ability_air_slide"},count=1},{codes={"ability_doubleflight"},count=1}}}},
    {world="Olympus",keyblade="kb_heros_origin",routes={{{codes={"unlock_wall_run"},count=1}}}},
    {world="Olympus",keyblade="kb_heros_origin",routes={{{codes={"unlock_wall_run"},count=1}}}},
    {world="Olympus",keyblade="kb_heros_origin",routes={{{codes={"unlock_wall_run"},count=1}}}},
    {world="Olympus",keyblade="kb_heros_origin",routes={{{codes={"unlock_wall_run"},count=1}}}},
    {world="Olympus",keyblade="kb_heros_origin",routes={{{codes={"unlock_wall_run"},count=1}}}},
    {world="Toy Box",keyblade="kb_favorite_deputy",routes={{{codes={"unlock_wall_run"},count=1}},{{codes={"ability_superjump"},count=1},{codes={"ability_wall_kick"},count=1},{codes={"ability_air_slide"},count=1}}}},
    {world="Toy Box",keyblade="kb_favorite_deputy",routes={}},
    {world="Toy Box",keyblade="kb_favorite_deputy",routes={}},
    {world="Toy Box",keyblade="kb_favorite_deputy",routes={}},
    {world="Toy Box",keyblade="kb_favorite_deputy",routes={}},
    {world="Toy Box",keyblade="kb_favorite_deputy",routes={}},
    {world="Toy Box",keyblade="kb_favorite_deputy",routes={{{codes={"unlock_wall_run"},count=1}},{{codes={"ability_high_jump"},count=1},{codes={"ability_doubleflight"},count=1}}}},
    {world="Toy Box",keyblade="kb_favorite_deputy",routes={}},
    {world="Toy Box",keyblade="kb_favorite_deputy",routes={{{codes={"unlock_wall_run"},count=1}},{{codes={"ability_high_jump"},count=1},{codes={"ability_doubleflight"},count=1}}}},
    {world="Toy Box",keyblade="kb_favorite_deputy",routes={}},
    {world="Toy Box",keyblade="kb_favorite_deputy",routes={}},
    {world="The Caribbean",keyblade="kb_wheel_of_fate",routes={{{codes={"unlock_wall_run"},count=1}}}},
    {world="The Caribbean",keyblade="kb_wheel_of_fate",routes={{{codes={"ability_doubleflight","ability_high_jump"},count=1}}}},
    {world="The Caribbean",keyblade="kb_wheel_of_fate",routes={}},
    {world="The Caribbean",keyblade="kb_wheel_of_fate",routes={}},
    {world="The Caribbean",keyblade="kb_wheel_of_fate",routes={}},
    {world="The Caribbean",keyblade="kb_wheel_of_fate",routes={{{codes={"ability_doubleflight","ability_high_jump"},count=1},{codes={"ability_glide"},count=1},{codes={"unlock_wall_run"},count=1}},{{codes={"ability_doubleflight","ability_high_jump"},count=1},{codes={"ability_air_slide"},count=1},{codes={"unlock_wall_run"},count=1}},{{codes={"ability_superjump"},count=1},{codes={"aero"},count=1},{codes={"unlock_magic"},count=1}}}},
    {world="The Caribbean",keyblade="kb_wheel_of_fate",routes={{{codes={"ability_doubleflight","ability_high_jump"},count=1},{codes={"ability_glide"},count=1},{codes={"unlock_wall_run"},count=1}},{{codes={"ability_doubleflight","ability_high_jump"},count=1},{codes={"ability_air_slide"},count=1},{codes={"unlock_wall_run"},count=1}},{{codes={"ability_superjump"},count=1},{codes={"aero"},count=1},{codes={"unlock_magic"},count=1}}}},
    {world="The Caribbean",keyblade="kb_wheel_of_fate",routes={}},
    {world="The Caribbean",keyblade="kb_wheel_of_fate",routes={}},
    {world="The Caribbean",keyblade="kb_wheel_of_fate",routes={}},
    {world="The Caribbean",keyblade="kb_wheel_of_fate",routes={}},
    {world="The Caribbean",keyblade="kb_wheel_of_fate",routes={}},
    {world="The Caribbean",keyblade="kb_wheel_of_fate",routes={}},
    {world="Monstropolis",keyblade="kb_happy_gear",routes={}},
    {world="Monstropolis",keyblade="kb_happy_gear",routes={}},
    {world="Monstropolis",keyblade="kb_happy_gear",routes={}},
    {world="Monstropolis",keyblade="kb_happy_gear",routes={}},
    {world="Monstropolis",keyblade="kb_happy_gear",routes={}},
    {world="Monstropolis",keyblade="kb_happy_gear",routes={}},
    {world="Monstropolis",keyblade="kb_happy_gear",routes={}},
    {world="Monstropolis",keyblade="kb_happy_gear",routes={}},
    {world="Monstropolis",keyblade="kb_happy_gear",routes={}},
    {world="Monstropolis",keyblade="kb_happy_gear",routes={{{codes={"unlock_wall_run"},count=1}},{{codes={"ability_superjump"},count=1},{codes={"ability_wall_kick"},count=1},{codes={"ability_air_slide"},count=1},{codes={"ability_doubleflight"},count=1}}}},
    {world="Monstropolis",keyblade="kb_happy_gear",routes={{{codes={"unlock_wall_run"},count=1}},{{codes={"ability_superjump"},count=1},{codes={"ability_wall_kick"},count=1},{codes={"ability_air_slide"},count=1},{codes={"ability_doubleflight"},count=1}}}},
    {world="Kingdom of Corona",keyblade="kb_ever_after",routes={{{codes={"unlock_wall_run"},count=1}}}},
    {world="Kingdom of Corona",keyblade="kb_ever_after",routes={}},
    {world="Kingdom of Corona",keyblade="kb_ever_after",routes={{{codes={"unlock_wall_run"},count=1}}}},
    {world="Kingdom of Corona",keyblade="kb_ever_after",routes={{{codes={"unlock_wall_run"},count=1}}}},
    {world="Kingdom of Corona",keyblade="kb_ever_after",routes={{{codes={"unlock_wall_run"},count=1}}}},
    {world="Kingdom of Corona",keyblade="kb_ever_after",routes={{{codes={"unlock_wall_run"},count=1}}}},
    {world="Kingdom of Corona",keyblade="kb_ever_after",routes={{{codes={"unlock_wall_run"},count=1}}}},
    {world="Kingdom of Corona",keyblade="kb_ever_after",routes={{{codes={"unlock_wall_run"},count=1}}}},
    {world="Kingdom of Corona",keyblade="kb_ever_after",routes={{{codes={"unlock_wall_run"},count=1}}}},
    {world="Arendelle",keyblade="kb_crystal_snow",routes={{{codes={"unlock_wall_run"},count=1},{codes={"ability_pole_spin"},count=1}},{{codes={"ability_superjump"},count=1},{codes={"ability_wall_kick"},count=1},{codes={"ability_air_slide"},count=1},{codes={"ability_doubleflight"},count=1},{codes={"ability_pole_spin"},count=1}}}},
    {world="Arendelle",keyblade="kb_crystal_snow",routes={{{codes={"ability_pole_spin"},count=1},{codes={"ability_air_slide"},count=1},{codes={"unlock_wall_run"},count=1}}}},
    {world="Arendelle",keyblade="kb_crystal_snow",routes={{{codes={"ability_pole_spin"},count=1},{codes={"ability_air_slide"},count=1},{codes={"unlock_wall_run"},count=1}}}},
    {world="Arendelle",keyblade="kb_crystal_snow",routes={{{codes={"ability_pole_spin"},count=1},{codes={"ability_air_slide"},count=1},{codes={"unlock_wall_run"},count=1}}}},
    {world="Arendelle",keyblade="kb_crystal_snow",routes={{{codes={"unlock_wall_run"},count=1}}}},
    {world="Arendelle",keyblade="kb_crystal_snow",routes={{{codes={"ability_pole_spin"},count=1},{codes={"ability_air_slide"},count=1},{codes={"unlock_wall_run"},count=1}}}},
    {world="Arendelle",keyblade="kb_crystal_snow",routes={{{codes={"ability_pole_spin"},count=1},{codes={"ability_air_slide"},count=1},{codes={"unlock_wall_run"},count=1}}}},
    {world="Arendelle",keyblade="kb_crystal_snow",routes={{{codes={"ability_pole_spin"},count=1},{codes={"ability_air_slide"},count=1},{codes={"unlock_wall_run"},count=1}}}},
    {world="Arendelle",keyblade="kb_crystal_snow",routes={{{codes={"ability_pole_spin"},count=1},{codes={"ability_air_slide"},count=1},{codes={"unlock_wall_run"},count=1}}}},
    {world="Arendelle",keyblade="kb_crystal_snow",routes={{{codes={"ability_pole_spin"},count=1},{codes={"ability_air_slide"},count=1},{codes={"unlock_wall_run"},count=1}}}},
    {world="Arendelle",keyblade="kb_crystal_snow",routes={{{codes={"ability_doubleflight","ability_high_jump"},count=1},{codes={"ability_pole_spin"},count=1},{codes={"ability_air_slide"},count=1},{codes={"unlock_wall_run"},count=1}}}},
    {world="San Fransokyo",keyblade="kb_nano_gear",routes={}},
    {world="San Fransokyo",keyblade="kb_nano_gear",routes={}},
    {world="San Fransokyo",keyblade="kb_nano_gear",routes={}},
    {world="San Fransokyo",keyblade="kb_nano_gear",routes={}},
    {world="San Fransokyo",keyblade="kb_nano_gear",routes={}},
    {world="San Fransokyo",keyblade="kb_nano_gear",routes={}},
    {world="San Fransokyo",keyblade="kb_nano_gear",routes={}},
    {world="San Fransokyo",keyblade="kb_nano_gear",routes={}},
    {world="San Fransokyo",keyblade="kb_nano_gear",routes={}},
    {world="San Fransokyo",keyblade="kb_nano_gear",routes={}},
    {world="San Fransokyo",keyblade="kb_nano_gear",routes={}},
    {world="Twilight Town",keyblade="kb_shooting_star",routes={}},
    {world="Twilight Town",keyblade="kb_shooting_star",routes={}},
    {world="Twilight Town",keyblade="kb_shooting_star",routes={{{codes={"unlock_wall_run"},count=1}},{{codes={"ability_superjump"},count=1},{codes={"ability_doubleflight","ability_high_jump"},count=1},{codes={"ability_wall_kick"},count=1},{codes={"ability_air_slide"},count=1}}}},
    {world="Twilight Town",keyblade="kb_shooting_star",routes={}},
    {world="Twilight Town",keyblade="kb_shooting_star",routes={{{codes={"unlock_wall_run"},count=1}},{{codes={"ability_superjump"},count=1},{codes={"ability_doubleflight","ability_high_jump"},count=1},{codes={"ability_wall_kick"},count=1},{codes={"ability_air_slide"},count=1}}}},
    {world="Twilight Town",keyblade="kb_shooting_star",routes={}},
    {world="Twilight Town",keyblade="kb_shooting_star",routes={{{codes={"unlock_wall_run"},count=1}},{{codes={"ability_superjump"},count=1},{codes={"ability_doubleflight","ability_high_jump"},count=1},{codes={"ability_wall_kick"},count=1},{codes={"ability_air_slide"},count=1}}}},
    {world="Twilight Town",keyblade="kb_shooting_star",routes={}},
    {world="Twilight Town",keyblade="kb_shooting_star",routes={}},
    {world="100 Acre Wood",keyblade=nil,routes={}},
    {world="100 Acre Wood",keyblade=nil,routes={}},
    {world="100 Acre Wood",keyblade=nil,routes={}},
}

local function emblemSpotReachable(spot)
    return worldReachable(spot.world, spot.keyblade) and anyRouteSatisfied(spot.routes)
end

function count_reachable_lucky_emblems()
    local count = 0
    for _, spot in ipairs(LUCKY_EMBLEM_SPOTS) do
        if emblemSpotReachable(spot) then
            count = count + 1
        end
    end
    return count
end

-- $can_reach_emblem_spot|<global id>
function can_reach_emblem_spot(global_id)
    local spot = LUCKY_EMBLEM_SPOTS[tonumber(global_id) or 0]
    if spot and emblemSpotReachable(spot) then return 1 end
    return 0
end

-- $can_reach_emblem_milestone|N
function can_reach_emblem_milestone(required)
    required = tonumber(required) or 0
    if count_reachable_lucky_emblems() >= required then return 1 end
    return 0
end

-- One milestone per emblem count, 1 to 90
EMBLEM_MILESTONES = {}
for i = 1, 90 do
    EMBLEM_MILESTONES[i] = i
end

-- Milestones that are checks when Lucky Emblems Per Check is 0
VANILLA_LUCKY_EMBLEM_MILESTONES = {
    [1] = true, [3] = true, [5] = true, [10] = true, [15] = true, [20] = true,
    [25] = true, [30] = true, [35] = true, [40] = true, [45] = true, [50] = true,
    [55] = true, [60] = true, [65] = true, [70] = true, [80] = true, [90] = true,
}

-- $is_active_emblem_milestone|N: every Nth emblem, or the vanilla milestones at 0
function is_active_emblem_milestone(target)
    target = tonumber(target) or 0
    local lep_check_obj = Tracker:FindObjectForCode("lep_check")
    local lep_check = lep_check_obj and lep_check_obj.AcquiredCount or 0
    if lep_check > 0 then
        if target <= 0 or target % lep_check ~= 0 then return 0 end
        return 1
    end
    if VANILLA_LUCKY_EMBLEM_MILESTONES[target] then return 1 end
    return 0
end

-- $any_emblem_milestone (visibility): a milestone exists up to the Lucky Emblem Limit.
function any_emblem_milestone()
    local limit = math.min(Tracker:ProviderCountForCode("le_limit"), 90)
    for target = 1, limit do
        if is_active_emblem_milestone(target) > 0 then return 1 end
    end
    return 0
end

-- $can_reach_emblem_milestone_gate|N: same idea as can_reach_level_gate
function can_reach_emblem_milestone_gate(target)
    target = tonumber(target) or 0
    local prev = nil
    for _, m in ipairs(EMBLEM_MILESTONES) do
        if m < target then
            prev = m
        end
    end
    if prev == nil then
        return can_reach_emblem_milestone(target)
    end
    return can_reach_emblem_milestone(prev)
end

-- ============================================================
-- World completion (Olympus Coliseum, photo missions, Gummi zones)
-- ============================================================

-- A world is completed once its final fight is in logic.
COLISEUM_WORLD_COMPLETION = {
    ["Olympus"]           = {keyblade="kb_heros_origin", routes={{{codes={"unlock_wall_run"},count=1}}}},
    ["Twilight Town"]     = {keyblade="kb_shooting_star", routes={}},
    ["Toy Box"]           = {keyblade="kb_favorite_deputy", routes={{{codes={"unlock_wall_run"},count=1}}}},
    ["Kingdom of Corona"] = {keyblade="kb_ever_after", routes={{{codes={"unlock_wall_run"},count=1},{codes={"ability_air_slide","ability_block","ability_dodge_roll"},count=2}}}},
    ["Monstropolis"]      = {keyblade="kb_happy_gear", routes={{{codes={"ability_air_slide"},count=1},{codes={"ability_doubleflight"},count=1},{codes={"ability_superjump"},count=1},{codes={"ability_wall_kick"},count=1},{codes={"unlock_magic"},count=1},{codes={"ability_block","ability_dodge_roll"},count=1}},{{codes={"unlock_magic"},count=1},{codes={"unlock_wall_run"},count=1},{codes={"ability_air_slide","ability_block","ability_dodge_roll"},count=2}}}},
    ["Arendelle"]         = {keyblade="kb_crystal_snow", routes={{{codes={"ability_air_slide"},count=1},{codes={"ability_pole_spin"},count=1},{codes={"unlock_wall_run"},count=1}}}},
    ["The Caribbean"]     = {keyblade="kb_wheel_of_fate", routes={}},
    ["San Fransokyo"]     = {keyblade="kb_nano_gear", routes={{{codes={"ability_pole_spin"},count=1},{codes={"aero"},count=1},{codes={"fire"},count=1},{codes={"unlock_magic"},count=1},{codes={"blizzard","water"},count=1}},{{codes={"ability_pole_spin"},count=1},{codes={"thunder"},count=1},{codes={"unlock_magic"},count=1},{codes={"blizzard","water"},count=1}}}},
}

local function coliseumWorldComplete(world)
    local entry = COLISEUM_WORLD_COMPLETION[world]
    if entry == nil then return false end
    return worldReachable(world, entry.keyblade) and anyRouteSatisfied(entry.routes)
end

-- $can_complete_coliseum_worlds|<World>|... (all of them)
function can_complete_coliseum_worlds(...)
    local worlds = {...}
    for _, world in ipairs(worlds) do
        if not coliseumWorldComplete(world) then return 0 end
    end
    return 1
end

-- $can_reach_final_boss: the goal items are collected
function can_reach_final_boss()
    local goal_obj = Tracker:FindObjectForCode("goal")
    if goal_obj and goal_obj.CurrentStage == 1 then
        if Tracker:ProviderCountForCode("heart_piece") >= 7 then return 1 end
        return 0
    end
    if countCodes({"proof_of_fantasy", "proof_of_promises", "proof_of_times_past"}) >= 3 then
        return 1
    end
    return 0
end

-- ============================================================
-- Classic Kingdom
-- ============================================================

CLASSIC_KINGDOM_GAME_CODES = {
    "ck_giantland", "ck_mickey_the_mail_pilot", "ck_the_musical_farmer",
    "ck_building_a_building", "ck_the_mad_doctor", "ck_mickeys_kitten_catch",
    "ck_the_klondike_kid", "ck_fishin_frenzy", "ck_the_karnival_kid",
    "ck_mickey_cuts_up", "ck_mickeys_prison_escape", "ck_how_to_play_baseball",
    "ck_how_to_play_golf", "ck_mickeys_circus", "ck_camping_out",
    "ck_taxi_troubles", "ck_beach_party", "ck_the_wayward_canary",
    "ck_mickeys_mechanical_man", "ck_the_barnyard_battle", "ck_cast_out_to_sea",
    "ck_backyard_sports", "ck_mickey_steps_out",
}

-- $has_all_classic_kingdom_games
function has_all_classic_kingdom_games()
    if countCodes(CLASSIC_KINGDOM_GAME_CODES) >= #CLASSIC_KINGDOM_GAME_CODES then
        return 1
    end
    return 0
end

-- ============================================================
-- Gummi space (include_space)
-- ============================================================

-- Worlds a Gummi ship can land on
local LANDING_WORLDS = {
    ["Olympus"]            = "kb_heros_origin",
    ["Twilight Town"]      = "kb_shooting_star",
    ["Toy Box"]            = "kb_favorite_deputy",
    ["Kingdom of Corona"]  = "kb_ever_after",
    ["Arendelle"]          = "kb_crystal_snow",
    ["Monstropolis"]       = "kb_happy_gear",
    ["San Fransokyo"]      = "kb_nano_gear",
    ["The Caribbean"]      = "kb_wheel_of_fate",
    ["Keyblade Graveyard"] = "kb_starlight",
}

-- $space_all_worlds
function space_all_worlds()
    for world, keyblade in pairs(LANDING_WORLDS) do
        if not worldReachable(world, keyblade) then return 0 end
    end
    return 1
end

-- Completed worlds a zone needs, on top of its blueprint
local SPACE_ZONE_COMPLETIONS = {
    space_starlight_way = 1,
    space_misty_stream  = 2,
    space_eclipse       = 3,
}

local function completedMainWorlds()
    local count = 0
    for world, _ in pairs(COLISEUM_WORLD_COMPLETION) do
        if coliseumWorldComplete(world) then count = count + 1 end
    end
    return count
end

local function spaceZoneOpen(zone_code)
    local needed = SPACE_ZONE_COMPLETIONS[zone_code]
    return needed ~= nil and hasCode(zone_code) and completedMainWorlds() >= needed
end

-- $space_zone_open|<zone code>
function space_zone_open(zone_code)
    if spaceZoneOpen(zone_code) then return 1 end
    return 0
end

-- $space_open_zones|N
function space_open_zones(needed)
    local count = 0
    for zone_code, _ in pairs(SPACE_ZONE_COMPLETIONS) do
        if spaceZoneOpen(zone_code) then count = count + 1 end
    end
    if count >= (tonumber(needed) or 0) then return 1 end
    return 0
end

-- $space_special_weapons|N (the shop adds Trinity Fire and Decoy Duckies)
function space_special_weapons(needed)
    local count = Tracker:ProviderCountForCode("space_special_weapon")
    if worldReachable("Twilight Town", LANDING_WORLDS["Twilight Town"]) then count = count + 1 end
    if coliseumWorldComplete("Monstropolis") then count = count + 1 end
    if count >= (tonumber(needed) or 0) then return 1 end
    return 0
end
