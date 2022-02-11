fx_version 'adamant'
--##Leaked by Mello#4301
game 'gta5'
name 'PowerAC'
version '3.0'
description 'Power AntiCheat Best Protection'



ui_page "code/nui/ui.html"

client_scripts {
    "code/entityiter.lua",
    "config/shared_config.lua",
    "client/client.lua",
} 
--##Leaked by Mello#4301

server_scripts {
    "code/entityiter.lua",
    'code/randomcode.lua',
    'code/installer.lua',
    ---
    'client/shared.lua',
    'config/shared_config.lua',
    'config/server_config.lua',
    'config/table_config.lua',
    'server/server.lua'
} 

--##Leaked by Mello#4301
files {
	"code/nui/ui.html",
	"code/nui/ui.js",
	"code/nui/ui.css"
}

