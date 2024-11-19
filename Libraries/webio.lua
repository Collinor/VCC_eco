--VCC_eco   webio.lua
--2024 / 10 / 30     20:18:56     Collinor



local KoM = ""                  -- Key of Message
local PoM = ""                  -- Protocol of Message
local ItC = ""                  -- Initial Computer
local modem = nil



function WebInit()
    modem = peripheral.find("modem") or error("No modem attached", 0)
    modem.transmit(io.read(), io.read(), "")
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

function ConnectionCheck()
    if rednet.isopen("modem") then
        
    end
    
end