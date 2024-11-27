--VCC_eco   mainwhile.lua
--2024 / 11 / 2     23:02:33     Collinor


MSG = ""
while true do
    if MSG == "FALSE" then break end            -- 当MSG为FALSE时，退出循环

    local CMD = ""
    local tArgs = ""

    if #MSG < 1 then
        MSG = string.lower(io.read()).."||"     -- 读取用户输入并转换为小写
    end

    for i = 1, #MSG-2 do                        -- 遍历字符串 MSG，找到 "||" 的位置
        if string.sub(MSG, i+1, i+2) == "||" then
            for j = 1, i do
                if string.sub(MSG, j, j) == " " then
                    CMD   = string.sub(MSG, 1, j-1)
                    tArgs = string.sub(MSG, j+1, i)
                    break
                end
            end
            MSG = string.sub(MSG, i+3, #MSG)
            break
        end
    end

    
end

