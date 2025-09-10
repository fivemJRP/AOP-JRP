---------------------------------------------
-- Name: sh_config
-- Type: Shared Config
-- Description: Configuration for AOP-JRP script.
-- Last Updated: 9/10/2025
-- Last Edit By: JGN Network developer team
-- Rebranded for AOP-JRP
---------------------------------------------

CONFIG = {}

-- Priority settings
CONFIG.PRIORITY = {}

-- Available regions (case insensitive)
CONFIG.PRIORITY.REGION = {
    'City',
    'Blaine',
    'Global'
}

-- Status configurations (case insensitive)
CONFIG.PRIORITY.STATUS = {
    -- Cooldown status with time-based messages
    ['Cooldown'] = {
        [0] = '~g~Available',           -- No cooldown
        [1] = '~r~{x} Minute Cooldown', -- Singular minute
        [2] = '~r~{x} Minutes Cooldown' -- Plural minutes
    },
    -- Other statuses
    ['Hold']       = '~b~On Hold',
    ['InProgress'] = '~g~In Progress',
    ['Pending']    = '~y~Pending',
    ['Reset']      = ''  -- Empty for reset
}

-- Default values (case sensitive)
CONFIG.DEFAULT = {
    ['COUNTY'] = {
        ['STATUS'] = 'cooldown',
        ['TIME']   = 15
    },
    ['CITY'] = {
        ['STATUS'] = 'cooldown',
        ['TIME']   = 15
    },
    ['AOP'] = '~g~Blaine County'
}

-- Debug mode: removes permission requirements on commands
CONFIG.DEBUG = false