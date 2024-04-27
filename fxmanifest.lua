fx_version "cerulean"
game "gta5"
lua54 'yes'

author 'Yetti Development'
description 'Evidence boxes for police.'

shared_scripts {
    "config.lua",
    '@ox_lib/init.lua',
}

client_scripts {
    "client/client.lua",
}

server_scripts {
    'server/server.lua'
}
