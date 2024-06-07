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

    if xSound:soundExists(soundname) then 
        xSound:Destroy(soundname)
        return
    end

    local soundId = xSound:PlayUrlPos(soundname, 'sounds/'..sound.sound, sound.volume, coords)
    xSound:Distance(soundname, sound.distance)
    
    CreateThread(function()
        AM.TrackEntitySound(entity, soundname)

        if xSound:soundExists(soundname) then
            xSound:Destroy(soundname)
        end
    end)
end)

RegisterNetEvent('am-megaphone:client:setSubmix', function(state, source)
    AM.VoiceOverMegaphone(state, source)
end)

--- KEYBINDS -----
RegisterCommand('megaphone', AM.OpenMenu)
RegisterKeyMapping('megaphone', AM.Translate['keymapp_desc'], 'keyboard', AM.OpenMenuBind)

----- EXPORTS -----

exports('OpenMenu', function()
    lib.showMenu('am_megaphone_menu')

    if AM.UseProp then
        AM.PlayAnimation(myped)
    end
end)

exports('IsWhitelisted', AM.IsWhitelisted)
exports('IsVehicleClassAllowed', AM.CheckVehicle)
exports('IsVehicleModelAllowed', AM.CheckVehicleModel)