--VCC_eco   webio.lua
--2024 / 10 / 30     20:18:56     Collinor



local KoM = ""                  -- Key of Message
local PoM = ""                  -- Protocol of Message
local ItC = ""                  -- Initial Computer
local id  = getComputerID ()    -- Computer ID



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