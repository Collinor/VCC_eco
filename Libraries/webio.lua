--VCC_eco   webio.lua
--2024 / 10 / 30     20:18:56     Collinor




local modem = nil



local webio = 
{
    uid                 = os.getComputerID(),
    ulable              = os.getComputerLabel(),
    KeyofMessage        = nil,
    ProtocolofMessage   = nil,
    RootAddress         = nil
}



webio.Init = function()
    if not fs.exists("VCC_sys/web/init.json") then
        ErrorPrint ("[WebInit] cannot be executed normally:No init.json")
        return false
    end
    local file = fs.open("VCC_sys/web/init.json", "r")
    local temp = {}
    while true do
        temp[#temp+1] = file.readLine()
        if not temp[#temp] then
            ErrorPrint ("[WebInit] cannot be executed normally:The JSON file is incomplete")
            break
        end
    end
    webio.KeyofMessage      = temp[1]
    webio.ProtocolofMessage = temp[2]
    webio.RootAddress       = temp[3]

    modem = peripheral.find("modem") or ErrorPrint("[WebInit] cannot be executed normally:No modem attached")
    if not rednet.isOpen("modem") then
        ErrorPrint ("[WebInit] cannot be executed normally:Failed to open the rednet")
        return false
    end
    rednet.send(webio.RootAddress, webio.KeyofMessage, webio.ProtocolofMessage)
    local id, MSG = rednet.receive(webio.ProtocolofMessage, 4)
    if MSG == nil then
        ErrorPrint ("[WebInit] cannot be executed normally:Failed to connect to the Root Server")
        return false
    end

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

function ConnectionCheck()
    if rednet.isopen("modem") then
        
    end
    
end