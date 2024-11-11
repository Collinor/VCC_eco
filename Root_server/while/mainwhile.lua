--VCC_eco   mainwhile.lua
--2024 / 11 / 2     23:02:33     Collinor


local MSG = ""
while true do
    if MSG == "FALSE" then break end        -- 当MSG为FALSE时，退出循环

    local CMD = ""

    if #MSG < 1 then
        MSG = string.lower(io.read())       -- 读取用户输入并转换为小写
    end

    for i = 1, #MSG-2 do                      -- 遍历字符串 MSG，找到第一个空格的位置
        if string.sub(MSG, i+1, i+2) == "||" then
            CMD = string.sub(MSG, 1, i)       -- 提取第一个单词作为命令
            break
        end
    end

    
end

