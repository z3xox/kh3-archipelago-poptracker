-- KH3 Archipelago Auto-Tracking
ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")

CUR_INDEX = -1

function onItem(index, item_id, item_name, player_id)
    if index <= CUR_INDEX then
        return
    end
    CUR_INDEX = index
    
    if not item_name then
        print(string.format("onItem: nil item_name for id %s", item_id))
        return
    end
    
    local mapping = ITEM_MAPPING_BY_NAME[item_name]
    if not mapping then
        print(string.format("onItem: no mapping for '%s' (id=%s)", item_name, item_id))
        return
    end
    
    local obj = Tracker:FindObjectForCode(mapping.code)
    if not obj then
        print(string.format("onItem: no tracker object for code '%s' (item='%s')", mapping.code, item_name))
        return
    end
    
    if mapping.type == "toggle" then
        obj.Active = true
    elseif mapping.type == "progressive" then
        if obj.CurrentStage then
            obj.CurrentStage = obj.CurrentStage + 1
        end
    elseif mapping.type == "consumable" then
        obj.AcquiredCount = (obj.AcquiredCount or 0) + 1
    end
    print(string.format("onItem: tracked '%s' -> %s", item_name, mapping.code))
end

function onLocation(location_id, location_name)
    local mapping = LOCATION_MAPPING[location_id]
    if not mapping then return end
    local section = Tracker:FindObjectForCode(mapping.code)
    if section then
        section.AvailableChestCount = 0
    end
end

function onClear(slot_data)
    CUR_INDEX = -1
    for name, mapping in pairs(ITEM_MAPPING_BY_NAME) do
        local obj = Tracker:FindObjectForCode(mapping.code)
        if obj then
            if mapping.type == "toggle" then
                obj.Active = false
            elseif mapping.type == "progressive" then
                obj.CurrentStage = 0
            elseif mapping.type == "consumable" then
                obj.AcquiredCount = 0
            end
        end
    end
end

Archipelago:AddClearHandler("clear handler", onClear)
Archipelago:AddItemHandler("item handler", onItem)
Archipelago:AddLocationHandler("location handler", onLocation)
