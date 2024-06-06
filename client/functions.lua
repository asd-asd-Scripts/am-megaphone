AM.InitMenu = function()
    if AM.MenuInitialized then return end

    local options = {{label = AM.Translate['own_voice'], checked = false}}

    for _, datas in pairs(AM.Sounds) do

        table.insert(options,
        {
            label = datas.label,
            icon = datas.icon,
            values = {},
            args = {},
            close = false
        })

        for i, v in ipairs(datas.sounds) do
            table.insert(options[#options].values, v.label)
            table.insert(options[#options].args, {
                sound = v.sound,
                volume = v.volume,
                distance = v.distance,
                label = v.label
            })
        end
    end

    lib.registerMenu({
        id = 'am_megaphone_menu',
        title = AM.Translate['menu_title'],
        position = AM.MenuLocation,
        options = options,
        onCheck = function(_, checked)
            if checked then
                exports['pma-voice']:overrideProximityRange(AM.ForcedProximity, false)
            else
                exports['pma-voice']:clearProximityOverride()
            end

            TriggerServerEvent('am-megaphone:server:setSubmix', checked)
        end,
        onClose = function()
            TriggerServerEvent('am-megaphone:server:setSubmix', false)
            if AM.UseProp then
                AM.StopAnimation()
            end
        end,
    }, function(selected, scrollIndex, args)
        AM.PlaySound(args[scrollIndex])
    end)

    AM.MenuInitialized = true
end

AM.OpenMenu = function()
    local myped = PlayerPedId()

    if AM.OnlyInVehicle then
        if not IsPedInAnyVehicle(myped) then return end

        local vehicle = GetVehiclePedIsIn(myped)

        if not AM.CheckVehicle(vehicle) and not AM.CheckVehicleModel(vehicle) then return end
    end

    if not AM.IsWhitelisted() then
        if AM.AlloweMiniGame then 
            local success = lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 2}, 'easy'}, {'w', 'a', 's', 'd'})
            if not success then 
                AM.Notification(AM.Translate['hacking_succ'], 5000, 'error')
                return 
            end
        else
            AM.Notification(AM.Translate['no_whitelisted_job'], 5000, 'error')
            return
        end
    end

    if AM.UseProp then
        AM.PlayAnimation(myped)
    end

    lib.showMenu('am_megaphone_menu')

    if AM.OnlyInVehicle then
        while IsPedInAnyVehicle(myped) do
            Wait(1000)
        end
        lib.hideMenu('am_megaphone_menu')
    end
end

AM.PlayAnimation = function(myped)
    myped = myped or PlayerPedId()
    local mycoords = GetEntityCoords(myped)

    AM.LoadModel(AM.PropModel)
    AM.MegaphoneProp = CreateObject(AM.PropModel, mycoords.x, mycoords.y, mycoords.z, true, true, false)
    AttachEntityToEntity(AM.MegaphoneProp, myped, GetPedBoneIndex(myped, 28422), 0.04, 0.05, 0.0, 90.0, -130.0, 170.0, false, false, false, false, 0, true)

    AM.LoadDict('weapons@first_person@aim_idle@generic@melee@knife@shared@core')
    TaskPlayAnim(myped, 'weapons@first_person@aim_idle@generic@melee@knife@shared@core', 'wall_block', 8.0, 8.0, -1, 51, 1, false, false, false)
end

AM.StopAnimation = function(myped)
    myped = myped or PlayerPedId()
    SetEntityAsMissionEntity(AM.MegaphoneProp, true, true)
    DeleteEntity(AM.MegaphoneProp)
    ClearPedTasks(myped)
end

AM.LoadModel = function(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(0)
    end
end

AM.LoadDict = function(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(0)
    end
end

AM.PlaySound = function(sound)
    TriggerServerEvent('am-megaphone:server:playsound', sound)
end

AM.TrackEntitySound = function(entity, soundname)
    local xSound = exports.xsound 

    while DoesEntityExist(entity) and xSound:soundExists(soundname) do
        local coords = GetEntityCoords(entity)
        
        xSound:Position(soundname, coords)
        Wait(100)
    end
end

AM.CheckVehicle = function(vehicle)
    local vehicleType = GetVehicleClass(vehicle)
    return AM.AllowedVehClass[vehicleType]
end

AM.CheckVehicleModel = function(vehicle)
    local vehicleModel = GetEntityModel(vehicle)
    return AM.AllowedVehicles[vehicleModel]
end

AM.InitSubmix = function()
    AM.SubmixFilter = CreateAudioSubmix("Megaphone")
    SetAudioSubmixEffectRadioFx(AM.SubmixFilter, 0)
    for hash, value in pairs(AM.SubmixSettings) do
        SetAudioSubmixEffectParamInt(AM.SubmixFilter, 0, hash, 1)
    end
    AddAudioSubmixOutput(AM.SubmixFilter, 0)
end

AM.VoiceOverMegaphone = function(checked, source)
    if checked then
        MumbleSetSubmixForServerId(source, AM.SubmixFilter)
        return
    end
    MumbleSetSubmixForServerId(source, -1)
    MumbleClearVoiceTargetPlayers(1.0)
end