fx_version 'cerulean'
games { 'gta5' }
author 'smith@devoplx'
description 'a simple yet cool teleport menu for your server.'
version '1.0.0'
lua54 'yes'

ui_page 'html/index.html'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'
}

files {
    'html/index.html',
    'html/js/script.js',
    'html/css/style.css',
}