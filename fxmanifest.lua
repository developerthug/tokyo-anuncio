-- fxmanifest.lua

fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Thug'
description 'Script de Anúncios usando ox_lib'
version '1.0.1'

-- Scripts do Cliente
client_scripts {
    'client.lua',
    
}


-- Scripts compartilhados
shared_scripts {
    '@ox_lib/init.lua'
}

-- Dependências necessárias
dependencies {
    'ox_lib',
    'qb-core'
}
