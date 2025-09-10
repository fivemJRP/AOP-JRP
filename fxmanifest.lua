---------------------------------------------
-- AOP-JRP Resource Manifest
-- Description: AOP and Priority Management for JRP
-- Author: JGN Network developer team
-- Version: 1.0.0
-- Last Updated: 9/10/2025
-- Optimized for performance and clarity
---------------------------------------------
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

-- Shared scripts
shared_scripts {
    'shared/sh_utility.lua',
    'sh_config.lua'
}

-- Client scripts
client_scripts {
    'client/cl_aop.lua'
}

-- Server scripts
server_scripts {
    'server/sv_aop.lua'
}

-- Additional metadata for cooler presentation
author 'JGN Network developer team'
description 'Enhanced AOP and Priority Management script for JRP with optimized rendering and branding.'
version '1.0.0'
