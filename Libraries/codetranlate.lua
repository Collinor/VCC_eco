--VCC_eco   codetranslate.lua
--2025 / 1 / 31     11:36:13     Collinor

local codelist = {

}

--local typelist = {}

getcode = function(type)
    return codelist[type]
end

gettype = function(code)
    local ret = {}
    for k,v in pairs(codelist) do
        if v == code then
            return k
        end
    end
    return ret
end


findtype = function(code) -- only for Lua-5.3
    return table.find(codelist, code)
end