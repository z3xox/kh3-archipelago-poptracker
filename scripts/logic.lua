-- Custom logic functions for KH3 Archipelago tracker
-- Referenced from access_rules as $function_name

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

-- Per-keyblade Style Change unlocks only exist when the seed has stylesanity
-- on (stage 1). With it off, Sora starts with the shared Style Change unlock,
-- so showing 17 items that can never drop would be misleading -- swap the
-- Gimmick Unlocks grid instead of listing them.
STYLE_CHANGE_KEYBLADE_SANITY = 1

-- Keyblade Levels (apworld option): 0 = start at max (no level items at all),
-- 1 = shuffled (ten shared Progressive Keyblade Level items), 2 = keyblade upgrade
-- sanity (ten Progressive <Keyblade> Level items per keyblade). Counters only
-- exist for the modes that use them: the shared one is listed in the Gimmick
-- Unlocks grid, the per-keyblade ones are drawn over the keyblade icons, and
-- start at max shows nothing.
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

-- Pandora's Power and Ultima Weapon have no Workshop upgrade check, but keyblade
-- upgrade sanity still shuffles their level items: a sixth Keyblades row shows
-- their counters in that mode only.
function update_keyblades_layout()
    if keyblade_levels_mode() == KEYBLADE_LEVELS_PER_KEYBLADE then
        Tracker:AddLayouts("layouts/keyblades_levels.json")
    else
        Tracker:AddLayouts("layouts/keyblades.json")
    end
end

-- The keyblades that have a Moogle Workshop upgrade check, by their tracker code.
KEYBLADE_LEVEL_KEYBLADES = {
    "kingdom_key", "kb_shooting_star", "kb_heros_origin", "kb_favorite_deputy", "kb_ever_after",
    "kb_wheel_of_fate", "kb_crystal_snow", "kb_hunny_spout", "kb_nano_gear", "kb_happy_gear",
    "kb_classic_tone", "kb_grand_chef", "kb_starlight", "kb_oathkeeper", "kb_oblivion",
}

-- "kb_ever_after" -> "lvl_ever_after", "kingdom_key" -> "lvl_kingdom_key"
local function keyblade_level_counter(keyblade_code)
    return "lvl_" .. (keyblade_code:gsub("^kb_", ""))
end

function update_keyblade_level_overlays()
    local per_keyblade = keyblade_levels_mode() == KEYBLADE_LEVELS_PER_KEYBLADE
    for _, code in ipairs(KEYBLADE_LEVEL_KEYBLADES) do
        local keyblade = Tracker:FindObjectForCode(code)
        if keyblade then
            if per_keyblade then
                local counter = Tracker:FindObjectForCode(keyblade_level_counter(code))
                keyblade:SetOverlay(tostring(counter and counter.AcquiredCount or 0))
                keyblade:SetOverlayFontSize(11)
            else
                keyblade:SetOverlay("")
            end
        end
    end
end

-- The five minigame max-rank settings share one icon, so each carries a short
-- "<minigame> <rank>" overlay to tell them apart. Stage index = option value
-- (0 = junk, 1..4 = D..A).
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

-- Tier-1 portal keyblades (WORLD_DIFFICULTY_TIERS[1] in the AP world).
-- 100 Acre Wood has no portal keyblade, so there are 7 total.
TIER_ONE_KEYBLADE_CODES = {
    "kb_heros_origin",     -- Olympus
    "kb_favorite_deputy",  -- Toy Box
    "kb_happy_gear",       -- Monstropolis
    "kb_ever_after",       -- Kingdom of Corona
    "kb_wheel_of_fate",    -- The Caribbean
    "kb_crystal_snow",     -- Arendelle
    "kb_nano_gear",        -- San Fransokyo
}

-- HIGHER_TIER_TIER_ONE_KEYBLADE_COUNT from the AP world
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

-- Portal Unlocks = party members (portal_party): a world opens with one of its
-- characters instead of its keyblade (PORTAL_PARTY_REGION_LOCKS in the AP world).
-- Indexed by the world's portal keyblade, which every rule names, so that one
-- "$portal|<keyblade>" atom covers both modes. Oathkeeper's two worlds (Radiant
-- Garden, Data Battles) both open with Riku.
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

-- Access rule helper: $portal|<portal keyblade> -> the world it opens is open.
function portal(keyblade)
    if portalOpen(keyblade) then return 1 end
    return 0
end

-- Access rule helper: $any_portal|<keyblade>|<keyblade>... -> any of those worlds is open.
function any_portal(...)
    for _, keyblade in ipairs({...}) do
        if portalOpen(keyblade) then return 1 end
    end
    return 0
end

-- Chestsanity: AP location id -> code of the keyblade the seed assigned to that
-- chest. Filled from slot_data on connect (autotracking.lua); empty when the
-- option is off, for chests that keep their own world's keyblade, and offline.
CHEST_KEYBLADE = {}

-- Access rule helper: $chest_keyblade|<AP location id>
function chest_keyblade(location_id)
    local keyblade = CHEST_KEYBLADE[tonumber(location_id)]
    if keyblade == nil or hasCode(keyblade) then return 1 end
    return 0
end

-- Music chest Song Bonuses in this seed: AP location id -> true. Which chests
-- are music chests is the seed's draw, read from slot_data on connect
-- (autotracking.lua); offline, no Song Bonus is shown.
SONG_BONUS = {}

-- Visibility helper: $song_bonus|<AP location id>
-- Offline the seed's music chests are unknown: the "Song Bonuses - Show All"
-- setting (song_bonus_all) shows every possible one instead.
function song_bonus(location_id)
    if SONG_BONUS[tonumber(location_id)] or hasCode("song_bonus_all") then return 1 end
    return 0
end

-- World pools this seed sets to junk: pool display name -> true, read from
-- slot_data on connect (autotracking.lua); offline none is known.
JUNK_WORLD_POOLS = {}

-- Visibility helper: $photo_mission_shown|<World>|<World>...
-- The apworld omits a photo mission when any world its subject needs
-- (Workshop.PHOTO_MISSION_COMPLETION_WORLDS) is junk: it is not a check then.
function photo_mission_shown(...)
    for _, world in ipairs({...}) do
        if JUNK_WORLD_POOLS[world] then return 0 end
    end
    return 1
end

-- Melody of Memory songs of this seed: song id -> code of the music chest it
-- opens (an authored Melody Chest or a converted vanilla chest), from slot_data.
MOM_SONG_CHEST = {}

-- Access rule helper: $mom_song_open|<song id>
-- A song's section follows the chest it opens: in logic when that chest is.
function mom_song_open(song_id)
    local code = MOM_SONG_CHEST[tonumber(song_id)]
    local chest = code and Tracker:FindObjectForCode(code)
    if not chest then return 0 end
    local normal = AccessibilityLevel and AccessibilityLevel.Normal or 6
    if (chest.AccessibilityLevel or 0) >= normal then return 1 end
    return 0
end

-- The tier gate counts open tier-one worlds: their keyblades, or in party-member
-- mode their characters ("Open tier-one worlds" in the AP world's Rules.py).
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

-- Twilight Town portal also needs "Block OR Air Slide OR Dodge Roll"
-- (TWILIGHT_TOWN_PORTAL_LOGIC_REQUIREMENTS from the AP world): any one of them.
DEFENSIVE_CODES = {"ability_block", "ability_air_slide", "ability_dodge_roll"}

function has_twilight_town_combat()
    if countCodes(DEFENSIVE_CODES) >= 1 then return 1 end
    return 0
end

function has_any_two_defensive()
    return has_twilight_town_combat()
end

-- The Caribbean portal also needs "Air Slide OR Dodge Roll OR Glide OR
-- Blizzard" (THE_CARIBBEAN_PORTAL_LOGIC_REQUIREMENTS from the AP world) --
-- one safety tool to survive the open water before the world is reachable.
-- Blizzard is a spell, so that route also needs the Magic unlock (the AP world
-- adds it to every route that names a Magic: item).
CARIBBEAN_SAFETY_TOOL_CODES = {"ability_air_slide", "ability_dodge_roll", "ability_glide"}

local function hasCaribbeanSafetyTool()
    if countCodes(CARIBBEAN_SAFETY_TOOL_CODES) >= 1 then return true end
    return hasCode("blizzard") and hasCode("unlock_magic")
end

function has_caribbean_safety_tool()
    if hasCaribbeanSafetyTool() then return 1 end
    return 0
end

-- Access rule helper: $keyblade_upgrade|<keyblade code>|<level>
-- A Moogle Workshop upgrade check needs its keyblade and, unless the seed starts
-- every keyblade at max, enough level items: the shared ones or that keyblade's own.
function keyblade_upgrade(keyblade_code, level)
    if not hasCode(keyblade_code) then return 0 end
    local mode = keyblade_levels_mode()
    if mode == 0 then return 1 end
    local counter = (mode == KEYBLADE_LEVELS_SHUFFLED) and "lvl_shared" or keyblade_level_counter(keyblade_code)
    if Tracker:ProviderCountForCode(counter) >= (tonumber(level) or 1) then return 1 end
    return 0
end

-- Generic helper: $has_any|code1|code2|...  -> 1 if any listed code is active
function has_any(...)
    local codes = {...}
    for _, code in ipairs(codes) do
        if hasCode(code) then return 1 end
    end
    return 0
end

-- Generic helper: $has_at_least|N|code1|code2|... -> 1 if at least N are active
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

-- A route is a list of clauses; each clause is {codes={...}, count=N}.
-- The route is satisfied when every clause has at least `count` of its codes.
local function routeSatisfied(route)
    for _, clause in ipairs(route) do
        if countCodes(clause.codes) < clause.count then
            return false
        end
    end
    return true
end

-- routes is a list of alternative routes; any one satisfied is enough.
-- An empty route list means no item requirement.
local function anyRouteSatisfied(routes)
    if routes == nil or #routes == 0 then return true end
    for _, route in ipairs(routes) do
        if routeSatisfied(route) then return true end
    end
    return false
end

-- ============================================================
-- World reachability (portal keyblade + tier gate)
-- ============================================================

-- Since apworld 0.17.21 only Data Battles keeps the gate of
-- HIGHER_TIER_TIER_ONE_KEYBLADE_COUNT tier-one keyblades on top of its portal
-- keyblade; story worlds rely on their check-level combat requirements.
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
    -- The Keyblade Graveyard entrance also needs Attraction Flow.
    if world == "Keyblade Graveyard" and not hasCode("unlock_attraction_flow") then
        return false
    end
    if world == "The Caribbean" and not hasCaribbeanSafetyTool() then
        return false
    end
    return true
end

-- ============================================================
-- Level Ups
-- ============================================================

-- LEVEL_UP_XP_SOURCE_REGION_NAMES and their portal keyblades
XP_SOURCE_WORLDS = {
    {world = "The Caribbean",     keyblade = "kb_wheel_of_fate"},
    {world = "Arendelle",         keyblade = "kb_crystal_snow"},
    {world = "Kingdom of Corona", keyblade = "kb_ever_after"},
    {world = "San Fransokyo",     keyblade = "kb_nano_gear"},
    {world = "Monstropolis",      keyblade = "kb_happy_gear"},
    {world = "Toy Box",           keyblade = "kb_favorite_deputy"},
    {world = "Twilight Town",     keyblade = "kb_shooting_star"},
}

-- SCALED_STORY_LEVEL_CAPS_BY_XP_SOURCE_COUNT
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

-- required_level_up_xp_source_count(level) from the AP world
function required_xp_sources_for_level(level)
    local total = #XP_SOURCE_WORLDS
    if level < 2 then return total end
    for required, cap in ipairs(LEVEL_CAPS) do
        if level <= cap then return required end
    end
    return total
end

-- Access rule helper: $can_reach_level|N
function can_reach_level(level)
    level = tonumber(level) or 0
    if count_reachable_xp_sources() >= required_xp_sources_for_level(level) then
        return 1
    end
    return 0
end

-- Access rule helper: $can_reach_level_gate|N
-- Required half of the level-up access rule. Leveling is grinding-bound, not hard-gated,
-- so a level should only be fully out of logic (red) while the previous level is itself
-- unreachable. Once the previous level is reachable, this level stays enabled and is
-- marked yellow (via the optional/bracketed can_reach_level|N rule) until its own,
-- stricter XP-source requirement is actually met.
function can_reach_level_gate(level)
    level = tonumber(level) or 0
    local prev = level - 1
    if prev < 2 then prev = 2 end
    return can_reach_level(prev)
end

-- ============================================================
-- Lucky Emblems
-- ============================================================

-- Auto-generated Lucky Emblem spot logic from AP world
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
    {world="Twilight Town",keyblade="kb_shooting_star",routes={}},
    {world="Twilight Town",keyblade="kb_shooting_star",routes={}},
    {world="Twilight Town",keyblade="kb_shooting_star",routes={{{codes={"unlock_wall_run"},count=1}},{{codes={"ability_superjump"},count=1},{codes={"ability_doubleflight","ability_high_jump"},count=1},{codes={"ability_wall_kick"},count=1},{codes={"ability_air_slide"},count=1}}}},
    {world="Twilight Town",keyblade="kb_shooting_star",routes={}},
    {world="Twilight Town",keyblade="kb_shooting_star",routes={{{codes={"unlock_wall_run"},count=1}},{{codes={"ability_superjump"},count=1},{codes={"ability_doubleflight","ability_high_jump"},count=1},{codes={"ability_wall_kick"},count=1},{codes={"ability_air_slide"},count=1}}}},
    {world="Twilight Town",keyblade="kb_shooting_star",routes={}},
    {world="Twilight Town",keyblade="kb_shooting_star",routes={{{codes={"unlock_wall_run"},count=1}},{{codes={"ability_superjump"},count=1},{codes={"ability_doubleflight","ability_high_jump"},count=1},{codes={"ability_wall_kick"},count=1},{codes={"ability_air_slide"},count=1}}}},
    {world="Twilight Town",keyblade="kb_shooting_star",routes={}},
    {world="Twilight Town",keyblade="kb_shooting_star",routes={}},
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
    {world="Kingdom of Corona",keyblade="kb_ever_after",routes={{{codes={"unlock_wall_run"},count=1}}}},
    {world="Kingdom of Corona",keyblade="kb_ever_after",routes={}},
    {world="Kingdom of Corona",keyblade="kb_ever_after",routes={{{codes={"unlock_wall_run"},count=1}}}},
    {world="Kingdom of Corona",keyblade="kb_ever_after",routes={{{codes={"unlock_wall_run"},count=1}}}},
    {world="Kingdom of Corona",keyblade="kb_ever_after",routes={{{codes={"unlock_wall_run"},count=1}}}},
    {world="Kingdom of Corona",keyblade="kb_ever_after",routes={{{codes={"unlock_wall_run"},count=1}}}},
    {world="Kingdom of Corona",keyblade="kb_ever_after",routes={{{codes={"unlock_wall_run"},count=1}}}},
    {world="Kingdom of Corona",keyblade="kb_ever_after",routes={{{codes={"unlock_wall_run"},count=1}}}},
    {world="Kingdom of Corona",keyblade="kb_ever_after",routes={{{codes={"unlock_wall_run"},count=1}}}},
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
    {world="Arendelle",keyblade="kb_crystal_snow",routes={{{codes={"unlock_wall_run"},count=1},{codes={"ability_pole_spin"},count=1}},{{codes={"ability_superjump"},count=1},{codes={"ability_wall_kick"},count=1},{codes={"ability_air_slide"},count=1},{codes={"ability_doubleflight"},count=1},{codes={"ability_pole_spin"},count=1}}}},
    {world="Arendelle",keyblade="kb_crystal_snow",routes={{{codes={"unlock_wall_run"},count=1},{codes={"ability_pole_spin"},count=1}}}},
    {world="Arendelle",keyblade="kb_crystal_snow",routes={{{codes={"ability_pole_spin"},count=1},{codes={"ability_air_slide"},count=1},{codes={"unlock_wall_run"},count=1}}}},
    {world="Arendelle",keyblade="kb_crystal_snow",routes={{{codes={"ability_pole_spin"},count=1},{codes={"ability_air_slide"},count=1},{codes={"unlock_wall_run"},count=1}}}},
    {world="Arendelle",keyblade="kb_crystal_snow",routes={{{codes={"ability_pole_spin"},count=1},{codes={"ability_air_slide"},count=1},{codes={"unlock_wall_run"},count=1}}}},
    {world="Arendelle",keyblade="kb_crystal_snow",routes={{{codes={"ability_pole_spin"},count=1},{codes={"ability_air_slide"},count=1},{codes={"unlock_wall_run"},count=1}}}},
    {world="Arendelle",keyblade="kb_crystal_snow",routes={{{codes={"ability_pole_spin"},count=1},{codes={"ability_air_slide"},count=1},{codes={"unlock_wall_run"},count=1}}}},
    {world="Arendelle",keyblade="kb_crystal_snow",routes={{{codes={"ability_pole_spin"},count=1},{codes={"ability_air_slide"},count=1},{codes={"unlock_wall_run"},count=1}}}},
    {world="Arendelle",keyblade="kb_crystal_snow",routes={{{codes={"ability_pole_spin"},count=1},{codes={"ability_air_slide"},count=1},{codes={"unlock_wall_run"},count=1}}}},
    {world="Arendelle",keyblade="kb_crystal_snow",routes={{{codes={"ability_pole_spin"},count=1},{codes={"ability_air_slide"},count=1},{codes={"unlock_wall_run"},count=1}}}},
    {world="Arendelle",keyblade="kb_crystal_snow",routes={{{codes={"ability_doubleflight","ability_high_jump"},count=1},{codes={"ability_pole_spin"},count=1},{codes={"ability_air_slide"},count=1},{codes={"unlock_wall_run"},count=1}}}},
    {world="The Caribbean",keyblade="kb_wheel_of_fate",routes={}},
    {world="The Caribbean",keyblade="kb_wheel_of_fate",routes={}},
    {world="The Caribbean",keyblade="kb_wheel_of_fate",routes={}},
    {world="The Caribbean",keyblade="kb_wheel_of_fate",routes={}},
    {world="The Caribbean",keyblade="kb_wheel_of_fate",routes={}},
    {world="The Caribbean",keyblade="kb_wheel_of_fate",routes={}},
    {world="The Caribbean",keyblade="kb_wheel_of_fate",routes={{{codes={"unlock_wall_run"},count=1}}}},
    {world="The Caribbean",keyblade="kb_wheel_of_fate",routes={{{codes={"ability_doubleflight","ability_high_jump"},count=1}}}},
    {world="The Caribbean",keyblade="kb_wheel_of_fate",routes={}},
    {world="The Caribbean",keyblade="kb_wheel_of_fate",routes={}},
    {world="The Caribbean",keyblade="kb_wheel_of_fate",routes={}},
    {world="The Caribbean",keyblade="kb_wheel_of_fate",routes={{{codes={"ability_doubleflight","ability_high_jump"},count=1},{codes={"ability_glide"},count=1},{codes={"unlock_wall_run"},count=1}},{{codes={"ability_doubleflight","ability_high_jump"},count=1},{codes={"ability_air_slide"},count=1},{codes={"unlock_wall_run"},count=1}},{{codes={"ability_superjump"},count=1},{codes={"aero"},count=1},{codes={"unlock_magic"},count=1}}}},
    {world="The Caribbean",keyblade="kb_wheel_of_fate",routes={{{codes={"ability_doubleflight","ability_high_jump"},count=1},{codes={"ability_glide"},count=1},{codes={"unlock_wall_run"},count=1}},{{codes={"ability_doubleflight","ability_high_jump"},count=1},{codes={"ability_air_slide"},count=1},{codes={"unlock_wall_run"},count=1}},{{codes={"ability_superjump"},count=1},{codes={"aero"},count=1},{codes={"unlock_magic"},count=1}}}},
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

-- Access rule helper: $can_reach_emblem_spot|N
-- Pin of the photographable spot with global id N (locations/lucky_emblem_spots.json).
function can_reach_emblem_spot(global_id)
    local spot = LUCKY_EMBLEM_SPOTS[tonumber(global_id) or 0]
    if spot and emblemSpotReachable(spot) then return 1 end
    return 0
end

-- Access rule helper: $can_reach_emblem_milestone|N
function can_reach_emblem_milestone(required)
    required = tonumber(required) or 0
    if count_reachable_lucky_emblems() >= required then return 1 end
    return 0
end

-- Ordered milestone thresholds as they appear in locations/lucky_emblems.json.
-- The apworld defines a check for every emblem count from 1 up to the total
-- spot count in data_from_ap/lucky_emblem_spots.json ("total": 90); which of
-- these are actually in logic for a given seed is a separate question, see
-- is_active_emblem_milestone below.
EMBLEM_MILESTONES = {}
for i = 1, 90 do
    EMBLEM_MILESTONES[i] = i
end

-- The KH3 apworld's fixed set of milestones with real (non-filler) vanilla
-- rewards, used when the seed's "Lucky Emblems Per Check" option is 0
-- (vanilla). Mirrors Data.py's VANILLA_LUCKY_EMBLEM_MILESTONES.
VANILLA_LUCKY_EMBLEM_MILESTONES = {
    [1] = true, [3] = true, [5] = true, [10] = true, [15] = true, [20] = true,
    [25] = true, [30] = true, [35] = true, [40] = true, [45] = true, [50] = true,
    [55] = true, [60] = true, [65] = true, [70] = true, [80] = true, [90] = true,
}

-- Access rule helper: $is_active_emblem_milestone|N
-- Whether milestone N is actually a check for the connected seed: with
-- "Lucky Emblems Per Check" (lep_check) set to a positive N, every Nth emblem
-- is a check; at 0 (vanilla), only VANILLA_LUCKY_EMBLEM_MILESTONES are.
-- Mirrors Data.py's filter_locations_for_options Lucky Emblems branch.
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

-- Access rule helper: $can_reach_emblem_milestone_gate|N
-- Required half of the milestone access rule. Mirrors can_reach_level_gate: a milestone
-- is only fully out of logic (red) while the previous milestone is itself unreachable.
-- Once the previous milestone is reachable, this milestone stays enabled and is marked
-- yellow (via the optional/bracketed can_reach_emblem_milestone|N rule) until we've
-- actually explored enough of the currently-reachable worlds to hit its own count.
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
-- Olympus Coliseum (third-party 1.4.2 pak)
-- ============================================================

-- COLISEUM_WORLD_COMPLETION_SOURCES from the AP world: completing a world means
-- clearing its final encounter, so each entry pairs the world's portal keyblade
-- with the item routes of that encounter's location (its VICTORY_BONUS_ /
-- EVENT_LOGIC_REQUIREMENTS plus the earlier story encounters it depends on, as
-- the finished location rule the AP world queries). The Twilight Town and
-- Caribbean combat gates live in worldReachable, so those two carry no routes.
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

-- Access rule helper: $can_complete_coliseum_worlds|World A|World B
-- COLISEUM_CUP_REQUIRED_WORLDS is an AND, not a set of alternatives.
function can_complete_coliseum_worlds(...)
    local worlds = {...}
    for _, world in ipairs(worlds) do
        if not coliseumWorldComplete(world) then return 0 end
    end
    return 1
end

-- Access rule helper: $can_reach_final_boss
-- COLISEUM_POSTGAME_CUP_IDS additionally require the base game to be cleared,
-- which AP expresses as the final door being reachable: the seed's goal items.
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

-- CLASSIC_KINGDOM_UNLOCK_ITEM_NAMES_BY_GAME_ID from the AP world, in LSIGAME
-- order. Each High Score check needs its own game; "Complete All Games" needs
-- every one of them.
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

-- Access rule helper: $has_all_classic_kingdom_games
function has_all_classic_kingdom_games()
    if countCodes(CLASSIC_KINGDOM_GAME_CODES) >= #CLASSIC_KINGDOM_GAME_CODES then
        return 1
    end
    return 0
end

-- ============================================================
-- Gummi space (include_space)
-- ============================================================

-- Space.LANDING_WORLDS: the nine worlds a Gummi ship can land on, with their portal
-- keyblade. Each is reachable under its hub entrance rule (worldReachable).
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

-- Access rule helper: $space_all_worlds -> every landing world is reachable.
function space_all_worlds()
    for world, keyblade in pairs(LANDING_WORLDS) do
        if not worldReachable(world, keyblade) then return 0 end
    end
    return 1
end

-- Space.WORLD_COMPLETIONS_BY_ZONE: a zone opens with its travel blueprint once
-- that many main worlds (COLISEUM_WORLD_COMPLETION) are completed.
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

-- Access rule helper: $space_zone_open|<zone code> -> that zone can be flown in.
function space_zone_open(zone_code)
    if spaceZoneOpen(zone_code) then return 1 end
    return 0
end

-- Access rule helper: $space_open_zones|N -> at least N zones can be flown in.
function space_open_zones(needed)
    local count = 0
    for zone_code, _ in pairs(SPACE_ZONE_COMPLETIONS) do
        if spaceZoneOpen(zone_code) then count = count + 1 end
    end
    if count >= (tonumber(needed) or 0) then return 1 end
    return 0
end

-- Access rule helper: $space_special_weapons|N
-- The native shop sells two weapons that never reach the pool: Trinity Fire unlocks on
-- Twilight Town arrival and Decoy Duckies once Monstropolis is completed. They count
-- next to the 11 randomized special weapons.
function space_special_weapons(needed)
    local count = Tracker:ProviderCountForCode("space_special_weapon")
    if worldReachable("Twilight Town", LANDING_WORLDS["Twilight Town"]) then count = count + 1 end
    if coliseumWorldComplete("Monstropolis") then count = count + 1 end
    if count >= (tonumber(needed) or 0) then return 1 end
    return 0
end
