Config = {}

Config.Debug = false -- Toggle debug - true / false


Config.DisplayDistance = 50

Config.BoxLocations = { -- Where the boxes are created at
   -- [1] = { coords = vector4(462.2334, -1003.0744, 24.9148, 270.2914), slots = 25, maxWeight = 35000, model = 'gr_prop_gr_gunlocker_01a'},
   [1] = {
      coords = vector4(463.5824, -1001.4473, 24.9148, 212.4257),
      slots = 25,
      maxWeight = 35000,
      model = 'gr_prop_gr_gunlocker_01a',
      label = 'Gun Racker',
      targetLabel = 'Open Gun Racker'
   },

   [2] = { coords = vector4(462.3722, -999.7912, 24.9149, 270.2914) },
   [3] = { coords = vector4(462.2588, -995.8603, 24.9149, 270.2914) }
}

-- Global values same for all stashes

Config.AccessJobs = {['police'] = 0, ['usa'] = 0} -- The jobs that can open the boxes  Reccomended to set to your police job

-- Default value if not changed in Config.BoxLocations
Config.StashLabel = 'CPZ Box %s' -- The name when the stash is open
Config.StashSlots = 50 -- Number of slots in the stash
Config.StashWeight = 50000 -- Max weight of the items inside the stash, 1000 = 1kg
Config.Model = `v_res_filebox01` -- The model of the evidence box



Config.TargetIcon = 'fa-solid fa-box'
Config.TargetLabel = 'Open CPZ Box: %s'
Config.TargetDistance = 5
