CreateThread(AM.InitSubmix)
CreateThread(AM.InitMenu)

----- EVENTS ------

RegisterNetEvent('am-megaphone:client:playsound', function(sound, source)
    local player = GetPlayerFromServerId(source)
    if not player or player == -1 then return end

    local entity = GetPlayerPed(player)
    local coords = GetEntityCoords(entity)

    local xSound = exports.xsound
    local soundname = 'am-megaphone'..tostring(source)

    local soundId = xSound:PlayUrlPos(soundname, 'sounds/'..sound.sound, sound.volume, coords)
    xSound:Distance(soundname, sound.distance)
    
    CreateThread(function()
        AM.TrackEntitySound(entity, soundname)
    end)
end)

RegisterNetEvent('am-megaphone:client:setSubmix', function(state, source)
    AM.VoiceOverMegaphone(state, source)
end)

--- KEYBINDS -----
RegisterCommand('megaphone', AM.OpenMenu)
RegisterKeyMapping('megaphone', AM.Translate['keymapp_desc'], 'keyboard', AM.OpenMenuBind)

RegisterCommand('testVoice', function()
    AM.UpdateSubmixStatus(true)
end)
RegisterCommand('testVoiceOff', function()
    AM.UpdateSubmixStatus(false)
end)