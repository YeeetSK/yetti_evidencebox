for k, v in ipairs(Config.BoxLocations) do
    local stashid, stashcoords = k, vector3(v.coords.x, v.coords.y, v.coords.z - 1)
    exports.ox_inventory:RegisterStash('CPZ' .. stashid, Config.StashLabel:format(stashid), Config.StashSlots, Config.StashWeight, nil, nil, stashcoords)

    if Config.Debug then
        print('Registering stash with id: CPZ' .. stashid)
    end
end