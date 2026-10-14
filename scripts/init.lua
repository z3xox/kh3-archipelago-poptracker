-- KH3 Archipelago PopTracker Pack
print("-- KH3 Archipelago Tracker --")

-- Items
Tracker:AddItems("items/items.json")
Tracker:AddItems("items/melody_of_memory.json")
Tracker:AddItems("items/settings.json")
Tracker:AddItems("items/lucky_emblem_spots.json")

-- Logic functions (must load before locations reference them)
ScriptHost:LoadScript("scripts/logic.lua")

-- Maps (dark variants swap in dark-themed map backgrounds; marker positions are identical)
local dark_variant = (Tracker.ActiveVariantUID == "dark_vertical" or Tracker.ActiveVariantUID == "dark_horizontal"
    or Tracker.ActiveVariantUID == "dark_vertical_compact" or Tracker.ActiveVariantUID == "dark_horizontal_compact"
    or Tracker.ActiveVariantUID == "0_dark_horizontal_optimized")
if dark_variant then
    Tracker:AddMaps("maps/maps_dark.json")
else
    Tracker:AddMaps("maps/maps.json")
end

-- Locations
ScriptHost:LoadScript("scripts/locations.lua")

-- Layouts (shared pieces, then the orientation/density-specific tracker_default)
Tracker:AddLayouts("layouts/common.json")
local horizontal_variant = (Tracker.ActiveVariantUID == "horizontal" or Tracker.ActiveVariantUID == "dark_horizontal"
    or Tracker.ActiveVariantUID == "horizontal_compact" or Tracker.ActiveVariantUID == "dark_horizontal_compact")
-- Compact variants drop Key Items/Classic Kingdom/Party Members to prioritize map space
local compact_variant = (Tracker.ActiveVariantUID == "vertical_compact" or Tracker.ActiveVariantUID == "horizontal_compact"
    or Tracker.ActiveVariantUID == "dark_vertical_compact" or Tracker.ActiveVariantUID == "dark_horizontal_compact")
local optimized_variant = (Tracker.ActiveVariantUID == "1_horizontal_optimized" or Tracker.ActiveVariantUID == "0_dark_horizontal_optimized")
if optimized_variant then
    -- Top row of groups + a stacked column of groups underneath, sized to avoid
    -- the width overflow the plain horizontal layout hits at narrow window widths
    Tracker:AddLayouts("layouts/tracker_horizontal_optimized.json")
elseif compact_variant then
    if horizontal_variant then
        Tracker:AddLayouts("layouts/tracker_horizontal_compact.json")
    else
        Tracker:AddLayouts("layouts/tracker_compact.json")
    end
else
    if horizontal_variant then
        Tracker:AddLayouts("layouts/tracker_horizontal.json")
    else
        Tracker:AddLayouts("layouts/tracker.json")
    end
end
Tracker:AddLayouts("layouts/broadcast.json")
Tracker:AddLayouts("layouts/settings.json")

-- Goal display swaps between Proofs / Heart Pieces based on the Goal setting
update_goal_layout()
ScriptHost:AddWatchForCode("goal_layout_watch", "goal", update_goal_layout)

-- Keyblade Style unlocks appear inside Gimmick Unlocks only with stylesanity on,
-- and the shared Keyblade Level counter only in the Shuffled keyblade levels mode
update_gimmick_layout()
ScriptHost:AddWatchForCode("gimmick_layout_watch", "style_change_setting", update_gimmick_layout)
ScriptHost:AddWatchForCode("gimmick_layout_levels_watch", "keyblade_levels_setting", update_gimmick_layout)

-- Keyblade Upgrade Sanity adds a Keyblades row for the Pandora's Power / Ultima Weapon levels
update_keyblades_layout()
ScriptHost:AddWatchForCode("keyblades_layout_levels_watch", "keyblade_levels_setting", update_keyblades_layout)

-- Per-keyblade levels (Keyblade Upgrade Sanity) are drawn over the keyblade icons
update_keyblade_level_overlays()
ScriptHost:AddWatchForCode("keyblade_level_overlay_mode_watch", "keyblade_levels_setting", update_keyblade_level_overlays)
for _, code in ipairs(KEYBLADE_LEVEL_KEYBLADES) do
    ScriptHost:AddWatchForCode("keyblade_level_overlay_" .. code, "lvl_" .. code:gsub("^kb_", ""), update_keyblade_level_overlays)
end

-- Minigame max-rank settings show "<minigame> <rank>" over their shared icon
update_minigame_rank_overlays()
for _, entry in ipairs(MINIGAME_RANK_SETTINGS) do
    ScriptHost:AddWatchForCode(entry[1] .. "_overlay_watch", entry[1], update_minigame_rank_overlays)
end

-- AutoTracking
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking/autotracking.lua")
end
