for k, v in ipairs(Config.BoxLocations) do
    local stashid, stashcoords = k, vector3(v.coords.x, v.coords.y, v.coords.z - 1)
    local slots = v.slots or Config.StashSlots
    local maxWeight = v.maxWeight or Config.StashWeight
    local label = v.label or Config.StashLabel:format(stashid)
    exports.ox_inventory:RegisterStash('CPZ' .. stashid, label, slots, maxWeight, nil, nil, stashcoords)

    if Config.Debug then
        print('Registering stash with id: CPZ' .. stashid)
    end
end