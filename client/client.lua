local model

for k, v in ipairs(Config.BoxLocations) do
    lib.zones.sphere({
        coords = v.coords,
        radius = Config.DisplayDistance,
        debug = Config.Debug,
        modelEntity = nil,
        targetID = nil,
        stashName = 'CPZ' .. k,
        onEnter = function (self)
            local modelHash, stashName = Config.Model, self.stashName

            lib.requestModel(modelHash)

            model = CreateObject(modelHash, v.coords.x, v.coords.y, v.coords.z - 1, v.coords.w, false) -- Creating the prop once loaded
            SetEntityHeading(model, v.coords.w)
            FreezeEntityPosition(model, true)
            SetModelAsNoLongerNeeded(model)
            self.modelEntity = model

          self.targetID = exports.ox_target:addSphereZone({
                coords = vec3(self.coords.x, self.coords.y, self.coords.z + 0.2),
                radius = 0.35,
                debug = Config.Debug,
                options = {{
                    onSelect = function(data)
                        exports.ox_inventory:openInventory('stash', stashName)
                    end,
                    icon = Config.TargetIcon,
                    label = (Config.TargetLabel):format(k),
                    distance = Config.TargetDistance,
                    groups = Config.AccessJobs
                }}
            })
        end,
        onExit = function (self)
            DeleteEntity(self.modelEntity)
            exports.ox_target:removeZone(self.targetID)
            SetModelAsNoLongerNeeded(Config.Model)
            SetEntityAsNoLongerNeeded(self.modelEntity)
            self.modelEntity = nil
        end
    })
end

AddEventHandler('onResourceStop', function(resource)
    if cache.resource ~= resource then return end
    if DoesEntityExist(model) then
        DeleteEntity(model)
        model = nil
    end
end)
