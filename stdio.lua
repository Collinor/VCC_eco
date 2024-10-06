--VCC_eco   stdio.lua
--2024 / 5 / 15     17:14:55     Collinor

local KoM = ""                  -- Key of Message
local PoM = ""                  -- Protocol of Message
local ItC = ""                  -- Initial Computer
local id  = getComputerID ()    -- Computer ID


WarnPoint = {0, 0}


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
--Message
function MessageExp (uid, string)
    if not rednet.send (uid, string, PoM) then
        ErrorPrint ("Failed to connect to Computer uid"..uid)
        return false
    end
    return true
end



function HTTPStream (uid, string)
    return true
end
    
function InitMessage (uid, classify)
    if not rednet.send (uid, classify, ItC) then
        ErrorPrint ("Failed to find Computer uid "..uid)
        return false
    end
    return true
end



function MapInit ()
    top.setbackgroundColor (colors.blue)
    top.clear()
    top.blit ("", colors.black, colors.red)
    return true
end

function SendMessages (uid, string, Key)                        -- "id_to_uid-key-string-EOM"
    if not rednet.send (uid, id.."_to_"..uid..Key..string.."EOM", PoM) then
        ErrorPrint ("Failed to connect to Computer uid "..uid)
        return false
    end
    return true
end


--file end