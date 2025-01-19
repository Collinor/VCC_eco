--VCC_eco   logio.lua -> lstream.lua
--2024 / 10 / 30     18:59:29     Collinor



LogTime = os.date ("%Y/%m/%d %H:%M:%S") -- 记录日志时间
CmdTime = os.date ("[%H:%M:%S]")        -- 记录命令时间



--
--Logio
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