-- KH3 Archipelago PopTracker Pack
print("-- KH3 Archipelago Tracker --")

-- Items
Tracker:AddItems("items/items.json")
Tracker:AddItems("items/melody_of_memory.json")
Tracker:AddItems("items/settings.json")
Tracker:AddItems("items/lucky_emblem_spots.json")

-- Logic (before the locations that use it)
ScriptHost:LoadScript("scripts/logic.lua")

-- Keyblade level cells (before the layouts that place them)
ScriptHost:LoadScript("scripts/keyblade_level_items.lua")

-- Maps
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

-- Layouts
Tracker:AddLayouts("layouts/common.json")
local horizontal_variant = (Tracker.ActiveVariantUID == "horizontal" or Tracker.ActiveVariantUID == "dark_horizontal"
    or Tracker.ActiveVariantUID == "horizontal_compact" or Tracker.ActiveVariantUID == "dark_horizontal_compact")
local compact_variant = (Tracker.ActiveVariantUID == "vertical_compact" or Tracker.ActiveVariantUID == "horizontal_compact"
    or Tracker.ActiveVariantUID == "dark_vertical_compact" or Tracker.ActiveVariantUID == "dark_horizontal_compact")
local optimized_variant = (Tracker.ActiveVariantUID == "1_horizontal_optimized" or Tracker.ActiveVariantUID == "0_dark_horizontal_optimized")
if optimized_variant then
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

-- Layout parts that follow the settings
update_goal_layout()
ScriptHost:AddWatchForCode("goal_layout_watch", "goal", update_goal_layout)

update_gimmick_layout()
ScriptHost:AddWatchForCode("gimmick_layout_watch", "style_change_setting", update_gimmick_layout)
ScriptHost:AddWatchForCode("gimmick_layout_levels_watch", "keyblade_levels_setting", update_gimmick_layout)

update_option_groups()
for _, group in ipairs(OPTION_GROUPS) do
    ScriptHost:AddWatchForCode(group[1] .. "_watch", group[2], update_option_groups)
end

update_keyblades_layout()
ScriptHost:AddWatchForCode("keyblades_layout_levels_watch", "keyblade_levels_setting", update_keyblades_layout)

update_keyblade_level_overlays()
ScriptHost:AddWatchForCode("keyblade_level_overlay_mode_watch", "keyblade_levels_setting", update_keyblade_level_overlays)
for _, code in ipairs(KEYBLADE_LEVEL_KEYBLADES) do
    ScriptHost:AddWatchForCode("keyblade_level_overlay_" .. code, "lvl_" .. code:gsub("^kb_", ""), update_keyblade_level_overlays)
end

update_minigame_rank_overlays()
for _, entry in ipairs(MINIGAME_RANK_SETTINGS) do
    ScriptHost:AddWatchForCode(entry[1] .. "_overlay_watch", entry[1], update_minigame_rank_overlays)
end

-- AutoTracking
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking/autotracking.lua")
end
