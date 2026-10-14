-- Keyblade Upgrade Sanity: the Keyblades grid (layouts/keyblades_levels.json)
-- shows one clickable cell per keyblade instead of its toggle. A cell walks one
-- scale -- not owned, owned (level 0), level 1 ... level 10 -- with a left click
-- going one step up and a right click one step down, like the Pandora's Power
-- and Ultima Weapon level counters next to them. A cell keeps no state of its
-- own: it reads and writes the keyblade toggle and its level counter, so the
-- autotracker and the logic keep using those.
-- LuaItems must exist before a layout places them: load this before the layouts.

local MAX_KEYBLADE_LEVEL = 10

local KEYBLADE_ICONS = {
    kingdom_key        = "images/items/keyblades/Kingdom Key.png",
    kb_shooting_star   = "images/items/keyblades/Shooting Star.png",
    kb_heros_origin    = "images/items/keyblades/Hero's Origin.png",
    kb_favorite_deputy = "images/items/keyblades/Favorite Deputy.png",
    kb_ever_after      = "images/items/keyblades/Ever After.png",
    kb_wheel_of_fate   = "images/items/keyblades/Wheel of Fate.png",
    kb_crystal_snow    = "images/items/keyblades/Crystal Snow.png",
    kb_hunny_spout     = "images/items/keyblades/Hunny Spout.png",
    kb_nano_gear       = "images/items/keyblades/Nano Gear.png",
    kb_happy_gear      = "images/items/keyblades/Happy Gear.png",
    kb_classic_tone    = "images/items/keyblades/Classic Tone.png",
    kb_grand_chef      = "images/items/keyblades/Grand Chef.png",
    kb_starlight       = "images/items/keyblades/Starlight.png",
    kb_oathkeeper      = "images/items/keyblades/Oathkeeper.png",
    kb_oblivion        = "images/items/keyblades/Oblivion.png",
}

-- "kb_ever_after" -> "ever_after", "kingdom_key" -> "kingdom_key"
local function keybladeSuffix(keyblade_code)
    return (keyblade_code:gsub("^kb_", ""))
end

local function refreshCell(cell)
    local keyblade = Tracker:FindObjectForCode(cell.keyblade)
    local counter = Tracker:FindObjectForCode(cell.counter)
    cell.item.IconMods = (keyblade and keyblade.Active) and "" or "@disabled"
    cell.item:SetOverlay(tostring(counter and counter.AcquiredCount or 0))
    cell.item:SetOverlayFontSize(11)
end

for _, keyblade_code in ipairs(KEYBLADE_LEVEL_KEYBLADES) do
    local suffix = keybladeSuffix(keyblade_code)
    local cell = {
        keyblade = keyblade_code,
        counter = "lvl_" .. suffix,
        code = "kblvl_" .. suffix,
    }
    local item = ScriptHost:CreateLuaItem()
    local keyblade = Tracker:FindObjectForCode(keyblade_code)
    item.Name = keyblade and keyblade.Name or keyblade_code
    item.Icon = ImageReference:FromPackRelativePath(KEYBLADE_ICONS[keyblade_code])
    item.CanProvideCodeFunc = function(self, code) return code == cell.code end
    -- Placement only: ownership and levels stay with the keyblade and its counter.
    item.ProvidesCodeFunc = function(self, code) return false end
    item.OnLeftClickFunc = function(self)
        local kb = Tracker:FindObjectForCode(cell.keyblade)
        local counter = Tracker:FindObjectForCode(cell.counter)
        if not (kb and counter) then return end
        if not kb.Active then
            kb.Active = true
        elseif counter.AcquiredCount < MAX_KEYBLADE_LEVEL then
            counter.AcquiredCount = counter.AcquiredCount + 1
        end
    end
    item.OnRightClickFunc = function(self)
        local kb = Tracker:FindObjectForCode(cell.keyblade)
        local counter = Tracker:FindObjectForCode(cell.counter)
        if not (kb and counter) then return end
        if counter.AcquiredCount > 0 then
            counter.AcquiredCount = counter.AcquiredCount - 1
        elseif kb.Active then
            kb.Active = false
        end
    end
    item.SaveFunc = function(self) return {} end
    item.LoadFunc = function(self, data) end
    cell.item = item
    ScriptHost:AddWatchForCode("keyblade_cell_" .. suffix, keyblade_code, function() refreshCell(cell) end)
    ScriptHost:AddWatchForCode("keyblade_cell_level_" .. suffix, cell.counter, function() refreshCell(cell) end)
    refreshCell(cell)
end
