fx_version 'adamant'
game 'gta5'
lua54 'yes'

author 'Barwoz | Barwoz Shop'
title 'bUnicorn'
description 'A Script Unicorn job for FiveM unpublished in RageUI.V2 optimized at 0.01ms!'
version '1.0.0'

shared_scripts {
    'shared/config.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
}

client_scripts {
    'RageUI/RMenu.lua',
    'RageUI/menu/RageUI.lua',
    'RageUI/menu/Menu.lua',
    'RageUI/menu/MenuController.lua',
    'RageUI/components/*.lua',
    'RageUI/menu/elements/*.lua',
    'RageUI/menu/items/*.lua',
    'RageUI/menu/panels/*.lua',
    'RageUI/menu/windows/*.lua',
}

client_scripts {
    'client/function.lua',
    'client/menu.lua',
    'client/cloack.lua',
    'client/boss.lua',
    'client/vehicle.lua',
    'client/farms.lua',
    'client/melange.lua',
    'client/achat.lua',
    'client/coffre.lua',
}

server_scripts {
    'server/main.lua',
}