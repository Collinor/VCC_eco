--VCC_eco   VCC_Power_Shell.lua
--2024 / 1 / 19     14:33:33     Collinor



local tArgs = {...}

local HistoryCmd = {}       -- 历史命令列表

local Cursor = {            -- 光标位置
    x = 1, y = 1
}
local selectPos = {         -- 选择区域终点
    x = nil, y = nil
}

local InputW, InputH = term.getSize()-- 输入框尺寸

local eventData = {}        -- 事件数据

local LButtonDown = false   -- 左键按下状态
local LButtonDrag = false   -- 左键拖动状态

local RButtonDown = false   -- 右键按下状态
local RButtonDrag = false   -- 右键拖动状态

local InputFocus  = false   -- 输入框焦点状态

local function CursorFlashes()   -- 光标闪烁
    term.setCursorPos(Cursor.x, Cursor.y)
    while true do
        term.write(string.char(0x16))
        sleep(0.5)
        term.write(HistoryCmd[Cursor.y][Cursor.x])
        sleep(0.5)
    end
end

local function getEventData()    -- 读取事件
    eventData = {os.pullEvent()}
end

local function refreshConsole()  -- 刷新控制台
    term.clear()
end

while true do                   -- 消息循环
    parallel.waitForAny(getEventData, CursorFlashes)     -- 同时读取事件和光标闪烁
    
    if eventData == nil then       -- 事件为空
        eventData = {os.pullEvent()}       -- 重新读取事件
    end

    
        if eventData[1] == "mouse_click" then   -- 鼠标点击
            if eventData[2] == 1 then               -- 左键单击
                LButtonDown = true
                Cursor.x = eventData[3]
                Cursor.y = eventData[4]
            end

            if eventData[2] == 2 then               -- 右键单击
                RButtonDown = true
            end
        end

        if eventData[1] == "mouse_up" then     -- 鼠标松开
            if eventData[2] == 1 then              -- 左键松开
                LButtonDown = false
                if LButtonDrag then
                    LButtonDrag = false
                    
                end
                Cursor.x = eventData[3]
                Cursor.y = eventData[4]
            end
            if eventData[2] == 2 then              -- 右键松开  显示介绍信息
                RButtonDown = false
                --local infor = getInfor(eventData[3], eventData[4])
                local inforWnd = window.create(term.current(), eventData[3], eventData[4])
                inforWnd.setBackgroundColor(colors.white)
                inforWnd.setTextColor(colors.black)
                inforWnd.clear()
                --inforWnd.write(infor)
            end
        end

        if eventData[1] == "mouse_frag" then   -- 鼠标拖动
            if LButtonDown then                     -- 左键拖动
                LButtonDrag = true
            end

            if RButtonDown then                     -- 右键拖动

            end
        
        end
    
        if eventData[1] == "char" then         -- 键盘按键

        end
    

    refreshConsole()

end