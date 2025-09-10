---------------------------------------------
-- Name: sv_aop
-- Type: Core
-- Description: Server core - AOP-JRP.
-- Last Updated: 9/10/2025
-- Last Edit By: JGN Network developer team
-- Rebranded for AOP-JRP
---------------------------------------------

-- Localize native functions
local _Wait = Wait
local _TriggerClientEvent = TriggerClientEvent

-- Configuration/Server objects.
CONFIG = CONFIG or {}
local AOP = CONFIG.DEFAULT

-- Webhook logging.
CONFIG.WEBHOOK = {}
CONFIG.WEBHOOK.URL = "PUT YOUR WEBHOOK HERE"
CONFIG.WEBHOOK.AVATAR = "https://cdn.discordapp.com/attachments/712460411538243584/713678212592435200/jrp.png"

-- Chat message utility.
local function chatMessage(player, msg)
    _TriggerClientEvent('chatMessage', player, '', {255, 255, 255}, '^8[JRP]^0 ' .. msg)
end

-- Send discord log with improved formatting.
local function discordLog(message)
    local date = os.date("%I:%M:%S %p GMT%z - %m/%d/%y (%a.)")
    PerformHttpRequest(CONFIG.WEBHOOK.URL, function(err, text, headers) end, 'POST', json.encode({
        content = string.format('**[ %s ] |** %s', date, message),
        avatar_url = CONFIG.WEBHOOK.AVATAR
    }), {['Content-Type'] = 'application/json'})
end

-- Update AOP information on the client.
local function updateAOP(src)
    src = src or -1
    _TriggerClientEvent('aop:update', src, {['COUNTY'] = AOP.COUNTY, ['CITY'] = AOP.CITY})
end

-- Update AOP status with optimizations.
local function setAOP(source, key, status)
    if key == 'global' then
        for _, region in ipairs(CONFIG.PRIORITY.REGION) do
            local lowerRegion = region:lower()
            if lowerRegion ~= key then
                setAOP(source, lowerRegion, status)
            end
        end
        return
    end

    if key:lower() == 'blaine' then key = 'county' end

    local upperKey = key:upper()
    local tbl = AOP[upperKey]

    if not tbl then return end

    if status == 'reset' then
        tbl.TIME = 0
        tbl.STATUS = 'cooldown'
        chatMessage(-1, string.format('The %s priority has been ^2reset^0 by ^3%s', key, GetPlayerName(source)))
    else
        chatMessage(-1, string.format('The %s priority has been set to ^2%s^0 by ^3%s', key, status, GetPlayerName(source)))
        tbl.TIME = 15
        tbl.STATUS = status
    end
    discordLog(string.format('The `%s` priority has been set to `%s` by `%s`', key, status, GetPlayerName(source)))
end

-- Parse priority command with better validation.
local function parsePriority(source, args, raw)

    local region = args[1]
    local status = args[2]
    local notes = args[3]

    -- Verify data is present.
    if not region or not status then
        return chatMessage(source, 'Usage: /setpriority <region> <status> [notes]')
    end

    region = region:lower()
    status = status:lower()

    -- Verify region is valid.
    if not tableIncludes(CONFIG.PRIORITY.REGION, region) then
        return chatMessage(source, 'Invalid region. Valid regions: ' .. table.concat(CONFIG.PRIORITY.REGION, ', '))
    end

    -- Verify status is valid.
    if not tableIncludes(getKeys(CONFIG.PRIORITY.STATUS), status) then
        return chatMessage(source, 'Invalid status. Valid statuses: ' .. table.concat(getKeys(CONFIG.PRIORITY.STATUS), ', '))
    end

    -- Update AOP information.
    setAOP(source, region, status)
    updateAOP()

    -- Send notes if valid.
    if notes then
        chatMessage(-1, '^1Priority Notes:^0 ' .. notes)
    end
end

-- Send requested AOP data.
RegisterNetEvent("aop:getAOP")
AddEventHandler("aop:getAOP", function()
    local src = source
    updateAOP(src)
    _TriggerClientEvent('aop:setAOP', src, AOP.AOP)
end)

-- Optimized timer handler using Citizen.CreateThread.
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000)  -- Wait 1 minute
        AOP.COUNTY.TIME = math.max(0, AOP.COUNTY.TIME - 1)
        AOP.CITY.TIME = math.max(0, AOP.CITY.TIME - 1)
        updateAOP()
    end
end)

-- /aop command with latest string handling.
RegisterCommand('aop', function(source, args, raw)
    local aop = raw:sub(5)  -- Remove "/aop " prefix
    AOP.AOP = aop
    _TriggerClientEvent('aop:setAOP', -1, aop)
    chatMessage(-1, string.format('The AOP has been changed to ^2%s^0 by ^3%s', aop, GetPlayerName(source)))
    discordLog(string.format('The AOP has been set to `%s` by `%s`', aop, GetPlayerName(source)))
end, not CONFIG.DEBUG)

-- /setpriority command
RegisterCommand('setpriority', function(source, args, raw)
    parsePriority(source, args, raw)
end, not CONFIG.DEBUG)

-- /setp command
RegisterCommand('setp', function(source, args, raw)
    parsePriority(source, args, raw)
end, not CONFIG.DEBUG)

-- Initial update
updateAOP()