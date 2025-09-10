---------------------------------------------
-- Name: sh_utility
-- Type: Utility
-- Description: Utility functions.

-- Last Updated: 04/11/22
---------------------------------------------

function getKeys(tbl)
    local keys = {}
    for k in pairs(tbl) do
        table.insert(keys, k)
    end
    return keys
end

function tableIncludes(tbl, value)
    value = value:lower()
    for _, v in pairs(tbl) do
        if v:lower() == value then return true end            
    end
    return false
end

function getProperKey(tbl, key)
    key = key:lower()
    for k in pairs(tbl) do
        if k:lower() == key then return k end            
    end
    return false
end