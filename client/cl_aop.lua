---------------------------------------------
-- Name: cl_aop_jrp
-- Type: Core
-- Description: Client core - AOP-JRP.

-- Last Updated: 9/10/2025
-- Last Edit By: JGN Network developer team
---------------------------------------------

-- Localize native functions
local _SetTextFont = SetTextFont
local _SetTextProportional = SetTextProportional
local _SetTextScale = SetTextScale
local _SetTextColour = SetTextColour
local _SetTextDropShadow = SetTextDropShadow
local _SetTextEdge =SetTextEdge
local _SetTextOutline = SetTextOutline
local _SetTextEntry = SetTextEntry
local _AddTextComponentString = AddTextComponentString
local _DrawText = DrawText
local _DrawRect = DrawRect
local _IsRadarHidden = IsRadarHidden
local _Wait = Wait

-- Configuration/Client objects.
CONFIG = CONFIG or {}
local AOP = CONFIG.DEFAULT
local DRAW = {}

-- Utility function to get table keys
local function getKeys(tbl)
    local keys = {}
    for k in pairs(tbl) do
        table.insert(keys, k)
    end
    return keys
end

-- Format timer text for screen.
function formatTimerText(key, time)
    return (CONFIG.PRIORITY.STATUS[key][time] or CONFIG.PRIORITY.STATUS[key][2]):gsub("{x}", time)
end

-- Update draw values.
function getDrawValues(key)
    DRAW[key] = {}

    local _key = getProperKey(CONFIG.PRIORITY.STATUS, AOP[key].STATUS)
    if (type(CONFIG.PRIORITY.STATUS[_key]) == 'table') then
        DRAW[key].NAME = formatTimerText(_key, AOP[key].TIME)
    else
        DRAW[key].NAME = CONFIG.PRIORITY.STATUS[_key]
    end

    DRAW[key].TIME = AOP[key].TIME
end

-- Set aop event.
RegisterNetEvent('aop:setAOP')
AddEventHandler('aop:setAOP', function(aop)
    AOP.AOP = aop
end)

-- Update aop data event.
RegisterNetEvent('aop:update')
AddEventHandler('aop:update', function(payload)
    for k, v in pairs(payload) do
        AOP[k] = v
        getDrawValues(k)
    end
end)

-- Rendering functions. (from original.)
function RenderTextScreen(x, y, width, height, scale, text, r, g, b)
    _SetTextFont(4)
    _SetTextProportional(0)
    _SetTextScale(scale, scale)
    _SetTextColour(r, g, b, 200)
    _SetTextDropShadow(0, 0, 0, 0, 255)
    _SetTextEdge(2, 0, 0, 0, 255)
    _SetTextDropShadow()
    _SetTextOutline()
    _SetTextEntry("STRING")
    _AddTextComponentString(text)
    _DrawText(x - width / 2, y - height / 2 + 0.005)
 end
 function RenderTextScreenAOP(x, y, width, height, scale, text, r, g, b)
    _SetTextFont(4)
    _SetTextProportional(0)
    _SetTextScale(scale, scale)
    _SetTextColour(r, g, b, 200)
    _SetTextDropShadow(0, 0, 0, 0, 255)
    _SetTextEdge(2, 0, 0, 0, 255)
    _SetTextDropShadow()
    _SetTextOutline()
    _SetTextEntry("STRING")
    _AddTextComponentString(text)
    _DrawText(x - width / 2, y - height / 2 + 0.005)
 end
-- Render Text.
Citizen.CreateThread(function()
    while true do
        if (_IsRadarHidden()) then
            _Wait(1000)
            goto skip
        else 
            _Wait(0)
        end
        -- Render something
        _DrawRect(0.424, 1.134, 0.5, 0.03, 0, 0, 0, 100)
        RenderTextScreen(0.424, 1.134, 0.5, 0.55, 0.3, 'County Priority: ~g~' .. DRAW.COUNTY.NAME, 0, 255, 0)
        -- Render something
        _DrawRect(0.424, 1.153, 0.5, 0.03, 0, 0, 0, 100)
        RenderTextScreen(0.424, 1.153, 0.5, 0.55, 0.3, 'City Priority: ~g~' .. DRAW.CITY.NAME, 0, 255, 0)
        -- Render AOP
        _DrawRect(0.424, 1.09, 0.5, 0.03, 0, 0, 0, 100)
        RenderTextScreenAOP(0.424, 1.09, 0.5, 0.55, 0.8, '~b~AOP:~w~ ' .. AOP.AOP, 0, 0, 255)
        ::skip::
    end
end)

-- Register drawing for COUNTY/CITY.
getDrawValues('COUNTY')
getDrawValues('CITY')

-- Retrieve initial AOP data.
TriggerServerEvent("aop:getAOP")

-- Chat Suggestions

-- /setpriority
TriggerEvent('chat:addSuggestion', '/setpriority', 'Set a regions priority status.', {
    { name="Region", help="Region Options: " .. table.concat(CONFIG.PRIORITY.REGION, ', ') },
    { name="Status", help="Status Options: " .. table.concat(getKeys(CONFIG.PRIORITY.STATUS), ', ') },
    { name="Notes", help="This is optional!" },
})

-- /setp (shorthand for setpriority)
TriggerEvent('chat:addSuggestion', '/setp', 'Set a regions priority status.', {
   { name="Region", help="Region Options: " .. table.concat(CONFIG.PRIORITY.REGION, ', ') },
   { name="Status", help="Status Options: " .. table.concat(getKeys(CONFIG.PRIORITY.STATUS), ', ') },
   { name="Notes", help="This is optional!" },
})

-- /aop
TriggerEvent('chat:addSuggestion', '/aop', 'Set the AOP region.', {
   { name="AOP", help="Area of play" },
})