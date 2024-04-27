for k, v in ipairs(Config.BoxLocations) do
    lib.zones.sphere({
        coords = v.coords,
        radius = Config.DisplayDistance,
        debug = Config.Debug,
        modelEntity = nil,
        targetID = nil,
        stashName = 'CPZ' .. k,
        model = v.model or Config.Model,
        targetLabel = v.targetLabel or Config.TargetLabel:format(k),
        onEnter = function (self)
            
            local modelHash, stashName = self.model, self.stashName

            lib.requestModel(modelHash)

            local model = CreateObject(modelHash, v.coords.x, v.coords.y, v.coords.z - 1, v.coords.w, false) -- Creating the prop once loaded
            FreezeEntityPosition(model, true)

            self.modelEntity = model

            self.targetID = exports.ox_target:addBoxZone({
                coords = vector3(self.coords.x, self.coords.y, self.coords.z - 1),
                size = vector3(1.2, 1.2, 3.0),
                rotation = 0.0,
                debug = Config.Debug,
                options = {
                    {
                        onSelect = function (data)
                            exports.ox_inventory:openInventory('stash', stashName)
                        end,
                        icon = Config.TargetIcon,
                        label = self.targetLabel,
                        distance = Config.TargetDistance,
                        groups = Config.AccessJobs
                    }
                }
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

