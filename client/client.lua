for k, v in ipairs(Config.BoxLocations) do
    local modelHash = Config.Model -- The prop

    if not HasModelLoaded(modelHash) then -- Checking if the model loaded, if it didn't, it waits
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Citizen.Wait(1)
        end
    end

    local model = CreateObject(modelHash, v.coords.x, v.coords.y, v.coords.z - 1, v.coords.w) -- Creating the prop once loaded
    FreezeEntityPosition(model, true) -- Freezing it at the location

    TriggerServerEvent('yettieEvidenceBox:registerStashes', k, vector3(v.coords.x, v.coords.y, v.coords.z - 1)) -- Registers the box with its ID

    --
    --- Register the net event for opening the stash
    --

    RegisterNetEvent('yettiEvidenceBox:openStash', function(numb)
        exports.ox_inventory:openInventory('stash', 'CPZ' .. numb)
    end)

    RegisterCommand('++openCpzBox' .. k, function ()
        exports.ox_inventory:openInventory('stash', 'CPZ' .. k)
    end)

    --
    --- Add a target box zone for the stash
    --
    exports.ox_target:addBoxZone({
        coords = vector3(v.coords.x, v.coords.y, v.coords.z - 1),
        size = vector3(1.2, 1.2, 3.0),
        rotation = 0.0,
        debug = Config.Debug,
        options = {
            {
                type = "client",
                command = '++openCpzBox' .. k,
                icon = Config.TargetIcon,
                label = Config.TargetLabel:format(k),
                distance = Config.TargetDistance,
                groups = Config.AccessJobs
            }
        }
    })




end

