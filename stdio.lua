--VCC_eco   stdio.lua
--2024 / 5 / 15     17:14:55     Collinor

local KoM = ""          -- Key of Message
local PoM = "VCC_eco"   -- Protocol of Message


--
--Cmdio



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



--
--SendMessage
function MessageExp (uid, string)
    if not rednet.send (uid, string, PoM) then
        ErrorPrint ("Failed to connect to Computer No."..uid)
        return false
    end
    return true
end

function SendMessages (uid, string, Key)
    if not rednet.send (uid, Key..string, PoM) then
        ErrorPrint ("Failed to connect to Computer No."..uid)
        return false
    end
    return true
end



--file end