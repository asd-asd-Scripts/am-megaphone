AM = {}

AM.MenuLocation = 'top-right'                                               --'top-left' or 'top-right' or 'bottom-left' or 'bottom-right'
AM.OpenMenuBind = 'I'                                                       --Whitch button should you press to open the menu
AM.AlloweMiniGame = false                                                    --Allow minigame if player isnt in the right job?
AM.ForcedProximity = 50.0                                                   --Proximity of the own voice megaphone

AM.Langauge = 'en'

AM.UseProp = true
AM.PropModel = `prop_megaphone_01`

AM.OnlyInVehicle = true

AM.Sounds = {
    ['en'] = {

        ["generals"] = {
            label = 'General',                                                  --Label of the button
            icon = 'bullhorn',                                                  --Name of the icon
            sounds = {
                {
                    label = 'Away that easy...',                                  --Label of the sound in the menu
                    sound = 'away_easy.ogg',                                      --Name of the sound
                    volume = 0.65,                                                --Volume of the sound
                    distance = 60.0                                             --Distance of the sound
                },
                {
                    label = 'We need to have a little...',                     --Label of the sound in the menu
                    sound = 'stop_chat.ogg',                                    --Name of the sound
                    volume = 0.65,                                                --Volume of the sound
                    distance = 60.0                                             --Distance of the sound
                },
                {
                    label = 'Step out of the vehicle',                             --Label of the sound in the menu
                    sound = 'step_out.ogg',                                       --Name of the sound
                    volume = 0.65,                                                --Volume of the sound
                    distance = 60.0                                             --Distance of the sound
                },
                {
                    label = 'Stop your vehicle',                                    --Label of the sound in the menu
                    sound = 'stop_vehicle-2.ogg',                                --Name of the sound
                    volume = 0.65,                                                --Volume of the sound
                    distance = 60.0                                             --Distance of the sound
                }
            }
        },
    
        ["territory"] = {
            label = 'Territory',                                          --Label of the button
            icon = 'building-circle-exclamation',                             --Name of the icon
            sounds = {
                {
                    label = 'Clear the area',                              --Label of the sound in the menu
                    sound = 'clear_the_area.ogg',                          --Name of the sound
                    volume = 0.65,                                                --Volume of the sound
                    distance = 60.0                                             --Distance of the sound
                },
                {
                    label = 'Disperse now!',                             --Label of the sound in the menu
                    sound = 'disperse_now.ogg',                         --Name of the sound
                    volume = 0.65,                                                --Volume of the sound
                    distance = 60.0                                             --Distance of the sound
                }
            }
        },

    },

    ['hu'] = {

        ["generals"] = {
            label = 'Általános felszólítások',                                  --Label of the button
            icon = 'bullhorn',                                                  --Name of the icon
            sounds = {
                {
                    label = 'Álljon félre...',                                  --Label of the sound in the menu
                    sound = 'aljonfelreajarmuvelazonnal.ogg',                   --Name of the sound
                    volume = 0.65,                                                --Volume of the sound
                    distance = 60.0                                             --Distance of the sound
                },
                {
                    label = 'Most azonnal álljon félre...',                     --Label of the sound in the menu
                    sound = 'alljfelremostazonnal.ogg',                         --Name of the sound
                    volume = 0.65,                                                --Volume of the sound
                    distance = 60.0                                             --Distance of the sound
                },
                {
                    label = 'Nem tudsz elbújni...',                             --Label of the sound in the menu
                    sound = 'nemtudszelbujni.ogg',                              --Name of the sound
                    volume = 0.65,                                                --Volume of the sound
                    distance = 60.0                                             --Distance of the sound
                },
                {
                    label = 'Véged van...',                                    --Label of the sound in the menu
                    sound = 'vegedvanfaszfejaddfelmagad.ogg',                   --Name of the sound
                    volume = 0.65,                                                --Volume of the sound
                    distance = 60.0                                             --Distance of the sound
                }
            }
        },

        ["territory"] = {
            label = 'Terület Felszólítások',                                  --Label of the button
            icon = 'building-circle-exclamation',                             --Name of the icon
            sounds = {
                {
                    label = 'Feltett kezekkel...',                              --Label of the sound in the menu
                    sound = 'feltettkezekkelmostazonnal.ogg',                   --Name of the sound
                    volume = 0.65,                                                --Volume of the sound
                    distance = 60.0                                             --Distance of the sound
                },
                {
                    label = 'Hagyja el a területet',                             --Label of the sound in the menu
                    sound = 'ittarendorseghagyjaelateruletetkulonbenbajlesz.ogg',--Name of the sound
                    volume = 0.65,                                                --Volume of the sound
                    distance = 60.0                                             --Distance of the sound
                }
            }
        },

    }

} AM.Sounds = AM.Sounds[AM.Langauge]

AM.AllowedJobs = {                                                          --Allowed jobs to use the Megaphone
    ['onkori'] = true,
    ['police'] = true,
    ['sheriff'] = true,
    ['atf'] = true,
    ['park_rangers'] = true,
    ['df'] = true,
    ['dea'] = true,
    ['cia'] = true,
    ['usmarshal'] = true,
    ['noose'] = true
}

AM.AllowedVehicles = {                                                      --Allowed vehicles to use the Megaphone
    [`police`] = true
}

AM.AllowedVehClass = {                                                      --Allowed vehicle classes to use the Megaphone
    [18] = true
}

AM.Translate = { 
    ["en"] = {
        ['menu_title'] = 'Police Megaphone',
        ['keymapp_desc'] = 'Police Megaphone',
        ['hacking_succ'] = 'You failed to hack the megaphone system!',
        ['no_whitelisted_job'] = 'You are not an officer!',
        ['own_voice'] = 'Use your own voice!',
        ['log_message'] = 'A player play this sound: %s',
        ['spam_prot'] = 'Dont spam!',
    },

    ["hu"] = {
        ['menu_title'] = 'Rendőrségi Megafon',
        ['keymapp_desc'] = 'Rendőrségi Megafon',
        ['hacking_succ'] = 'Nem sikerült feltörnöd a megafon rendszerét!',
        ['no_whitelisted_job'] = 'Nem vagy rendőr!',
        ['own_voice'] = 'Saját hang használata',
        ['log_message'] = 'Egy játékos használta a megaphone-t, lejátszott hang: %s',
        ['spam_prot'] = 'Ne ilyen gyorsan!',
    },
} AM.Translate = AM.Translate[AM.Langauge]

AM.SubmixSettings = {
    [`default`] = 1,
    [`freq_low`] = 300.0,
    [`freq_hi`] = 5000.0,
    [`rm_mod_freq`] = 0.0,
    [`rm_mix`] = 0.2,
    [`fudge`] = 0.0,
    [`o_freq_lo`] = 550.0,
    [`o_freq_hi`] = 0.0,
}

AM.Notification = function(text, time, type)
   Core.ShowNotification(text)
end