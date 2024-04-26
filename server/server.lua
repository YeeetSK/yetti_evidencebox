RegisterNetEvent('yettieEvidenceBox:registerStashes', function (stashid, stashcoords)

    exports.ox_inventory:RegisterStash('CPZ' .. stashid, Config.StashLabel:format(stashid), Config.StashSlots, Config.StashWeight, nil, nil, stashcoords)

    if Config.Debug then
        print('Registering stash with id: CPZ' .. stashid)
    end
end)