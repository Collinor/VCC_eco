--VCC_eco   VCC_Caption1.lua
--2024 / 5 / 9     19:10:25     Collinor



--require ("stdio")
require ("function")



MSG = nil
MSGLog = {{0, nil, ""}, {0, nil, ""}}
MSGCmd = {{0, 0, 0, ""}, {0, 0, 0, ""}}

LogLn = 1
CmdLn = 1

Permissions = {{0, "Admin"}, {1, "User"}, {2, "Guest"}}



--
--init
 if peripheral.isPresent ("top") then
    top = peripheral.wrap ("top")
    else goto EndWhile
 end





--
--logio
top.setTextColor (colors.Black)
function SystemPrint (string)
    top.blit (CmdTime, colors.gray, colors.white)
    top.blit ("System ", colors.black, colors.lightGray)
    top.blit (string.."\n", colors.black, colors.white)
    MSGLog[LogLn] = {0, false, string.."\n"}
    LogLn = LogLn + 1

    return true
end

function WarnPrint (string)
    top.blit (CmdTime, colors.gray, colors.white)
    top.blit ("Warning", colors.black, colors.yellow)
    top.blit (string.."\n", colors.black, colors.white)
    MSGLog[LogLn] = {1, false, string.."\n"}
    LogLn = LogLn + 1

    return true
end

function ErrorPrint (string)
    top.blit (CmdTime, colors.yellow, colors.white)
    top.blit (" Error ", colors.black, colors.orange)
    top.blit (string.."\n", colors.black, colors.white)
    MSGLog[LogLn] = {2, false, string.."\n"}
    LogLn = LogLn + 1

    return true
end

function FalatPrint (string)
    top.blit (CmdTime, colors.orange, colors.white)
    top.blit (" Falat ", colors.white, colors.red)
    top.blit (string.."\n", colors.black, colors.white)
    MSGLog[LogLn] = {3, true, string.."\n"}
    LogLn = LogLn + 1
    MSG = "False"

    return true
end





--
--stdio
function AdminPrint (string)
    top.blit (LogLn, colors.white, colors.black)
    top.blit ("Admin", colors.black, colors.lightGray)
    
end





while true do
    if MSG == "False" then goto EndWhile end        -- 检查是否严重错误

    MSG = nil                               -- 清空MSG
    MSG = io.read ()                        -- 从标准输入读取一行数据赋值给变量 MSG
    if MSG == nil then goto continue end    -- 检查是否读取成功
    if MSG == "" then goto continue end     -- 检查是否为空

    LogTime = os.date ("%Y/%m/%d %H:%M:%S") -- 记录日志时间
    CmdTime = os.date ("[%H:%M:%S]")        -- 记录命令时间
    if MSG == "exit" then                   -- 是否退出
        SystemPrint ("Exiting...")
        goto EndWhile
    end


    


    if MSG == "help" then
        HelpPrint ("")
    end





    ::continue::
end

::EndWhile::

FalsePrint ("MessageWhile has ended!\n")

--file end