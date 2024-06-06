fx_version 'cerulean'
game 'gta5'

name "am-megaphone"
description "Megaphone script for FiveM"
author "Amitae, asd.asd"
version "1.1.2"
lua54 "yes"

shared_scripts {
	'@ox_lib/init.lua',
	'shared/*.lua',
	'init.lua',
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'server/main.lua',
	'server/webhook.lua'
}
