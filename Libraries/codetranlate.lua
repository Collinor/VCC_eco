--VCC_eco   codetranslate.lua
--2025 / 1 / 31     11:36:13     Collinor

local codelist = {
    -- 0x0###     SYS & NET
    [0x0000] = "SYS",
    [0x0001] = "SYS_START",
    [0x0002] = "SYS_SAVE",
    [0x0003] = "SYS_SHUTDOWN",
    [0x0004] = "SYS_EXIT",

    [0x0800] = "NET",
    [0x0801] = "NET_INIT",

    -- 0x1###     ERR
    [0x1000] = "ERR",
    [0x1001] = "ERR_SYS_START",
    [0x1002] = "ERR_SYS_SAVE",
    [0x1003] = "ERR_SYS_SHUTDOWN",
    [0x1004] = "ERR_SYS_EXIT",

    -- 0x2###     VCCAPP
    [0x2000] = "APP",
    [0x2001] = "APP_LISTINIT",

    -- 0x3###     Operation
    [0x3000] = "OPT",

    -- 0x9### ~ 0xE###   UserDef   
    [0x9000] = "UDEF",

    -- 0xF###     MC & CraftOs
    [0xF000] = "MC",
}

--local directivelist = {}

getdirective = function(code)
    if type(code) ~= "number" then
        return nil
    end
    return codelist[code]
end

getcode = function(directive) -- for Lua-5.2 and lower
    if type(directive) ~= "string" then
        return nil
    end
    for i, v in pairs(codelist) do
        if v == directive then
            return i
        end
    end
    return nil
end

findcode = function(directive) -- only for Lua-5.3
    if type(directive) ~= "string" then
        return nil
    end
    return table.find(codelist, directive)
end

addcode = function(directive, code)
    if code then
        if type(codelist[code]) ~= "number" then
            return nil
        end

        for i, v in pairs(codelist) do
            if v == directive then
                return i
            end
        end
        if codelist[code] or code > 0xEFFF or code < 0x9001 then
            for i = 0x9001, 0xEFFF do
                if not codelist[i] then
                    return i
                end
            end
        else
            codelist[code] = directive
            return code
        end
    else
        for i = 0x9001, 0xEFFF do
            if not codelist[i] then
                return i
            end
        end
    end
end

delcode = function(code)
    if 0x9000 < code < 0xF000 then
        codelist[code] = nil
        return code
    else
        return nil
    end
end

