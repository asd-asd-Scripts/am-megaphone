RegisterNetEvent('am-megaphone:server:playsound')
AddEventHandler('am-megaphone:server:playsound', function(sound)
    local _source = source

    TriggerClientEvent('am-megaphone:client:playsound', -1, sound, _source)

    if AM.Webhook ~= '' then
        local Player = AM.GetPlayer(_source)

        AM.SendToDiscord(string.format(AM.Translate['log_message'], sound.label), Player)
    end
end)

RegisterNetEvent('am-megaphone:server:setSubmix')
AddEventHandler('am-megaphone:server:setSubmix', function(state)
    local _source = source

    TriggerClientEvent('am-megaphone:client:setSubmix', -1, state, _source)
end)
