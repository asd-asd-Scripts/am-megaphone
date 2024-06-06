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
        end,
    }, function(selected, scrollIndex, args)
        AM.PlaySound(args[scrollIndex])
    end)

    AM.MenuInitialized = true
end

AM.OpenMenu = function()
    local myped = PlayerPedId()

    if not IsPedInAnyVehicle(myped) then return end

    local vehicle = GetVehiclePedIsIn(myped)

    if not AM.CheckVehicle(vehicle) then return end

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

    lib.showMenu('am_megaphone_menu')

    while IsPedInAnyVehicle(myped) do
        Wait(1000)
    end
    lib.hideMenu('am_megaphone_menu')
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

local filter

AM.InitSubmix = function()
    filter = CreateAudioSubmix("Megaphone")
    SetAudioSubmixEffectRadioFx(filter, 0)
    for hash, value in pairs(AM.SubmixSettings) do
        SetAudioSubmixEffectParamInt(filter, 0, hash, 1)
    end
    AddAudioSubmixOutput(filter, 0)
end

AM.VoiceOverMegaphone = function(checked, source)
    if checked then
        MumbleSetSubmixForServerId(source, filter)
        return
    end
    MumbleSetSubmixForServerId(source, -1)
    MumbleClearVoiceTargetPlayers(1.0)
end