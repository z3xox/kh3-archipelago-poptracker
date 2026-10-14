-- Keyblade upgrade sanity: one cell per keyblade, from not owned up to 10 level
-- items. Left click +1, right click -1. The cells only drive the keyblade toggle
-- and its level counter. Pandora's Power and Ultima Weapon only count levels.

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
    pandoras_power     = "images/items/keyblades/Pandora.png",
    ultima_weapon      = "images/items/keyblades/Ultima.png",
}

local LEVEL_ONLY_CELLS = {
    {"pandoras_power", "Pandora's Power"},
    {"ultima_weapon", "Ultima Weapon"},
}

local function keybladeSuffix(keyblade_code)
    return (keyblade_code:gsub("^kb_", ""))
end

local function refreshCell(cell)
    local keyblade = cell.keyblade and Tracker:FindObjectForCode(cell.keyblade)
    local counter = Tracker:FindObjectForCode(cell.counter)
    local owned = cell.keyblade == nil or (keyblade and keyblade.Active)
    cell.item.IconMods = owned and "" or "@disabled"
    cell.item:SetOverlay(tostring(keyblade_display_level(counter and counter.AcquiredCount or 0)))
    cell.item:SetOverlayFontSize(11)
end

-- keyblade_code is nil for a level-only cell.
local function makeCell(suffix, keyblade_code, name)
    local cell = {
        keyblade = keyblade_code,
        counter = "lvl_" .. suffix,
        code = "kblvl_" .. suffix,
    }
    local item = ScriptHost:CreateLuaItem()
    item.Name = name
    item.Icon = ImageReference:FromPackRelativePath(KEYBLADE_ICONS[keyblade_code or suffix])
    item.CanProvideCodeFunc = function(self, code) return code == cell.code end
    item.ProvidesCodeFunc = function(self, code) return false end
    item.OnLeftClickFunc = function(self)
        local kb = cell.keyblade and Tracker:FindObjectForCode(cell.keyblade)
        local counter = Tracker:FindObjectForCode(cell.counter)
        if not counter then return end
        if kb and not kb.Active then
            kb.Active = true
        elseif counter.AcquiredCount < MAX_KEYBLADE_LEVEL then
            counter.AcquiredCount = counter.AcquiredCount + 1
        end
    end
    item.OnRightClickFunc = function(self)
        local kb = cell.keyblade and Tracker:FindObjectForCode(cell.keyblade)
        local counter = Tracker:FindObjectForCode(cell.counter)
        if not counter then return end
        if counter.AcquiredCount > 0 then
            counter.AcquiredCount = counter.AcquiredCount - 1
        elseif kb and kb.Active then
            kb.Active = false
        end
    end
    item.SaveFunc = function(self) return {} end
    item.LoadFunc = function(self, data) end
    cell.item = item
    if keyblade_code then
        ScriptHost:AddWatchForCode("keyblade_cell_" .. suffix, keyblade_code, function() refreshCell(cell) end)
    end
    ScriptHost:AddWatchForCode("keyblade_cell_level_" .. suffix, cell.counter, function() refreshCell(cell) end)
    refreshCell(cell)
end

for _, keyblade_code in ipairs(KEYBLADE_LEVEL_KEYBLADES) do
    local keyblade = Tracker:FindObjectForCode(keyblade_code)
    makeCell(keybladeSuffix(keyblade_code), keyblade_code, keyblade and keyblade.Name or keyblade_code)
end
for _, entry in ipairs(LEVEL_ONLY_CELLS) do
    makeCell(entry[1], nil, entry[2])
end
