--VCC_eco   webio.lua -> ModemDevice.lua
--2024 / 10 / 30     20:18:56     Collinor




modem = nil



local vccnet = 
{
    cid                 = os.getComputerID(),
    ulable              = os.getComputerLabel(),
    KeyofMessage        = nil,
    ProtocolofMessage   = nil,
    RootAddress         = nil,
    uid                 = nil
}



vccnet.Init = function()
    -- 从JSON文件中读入设置
    if not fs.exists("VCC_sys/web/init.json") then
        FalatPrint ("[WebInit] cannot be executed normally:No init.json")
        return false
    end
    local file = fs.open("VCC_sys/web/init.json", "r")
    local temp = {}
    while true do
        temp[#temp+1] = file.readLine()
        if not temp[#temp] then
            FalatPrint ("[WebInit] cannot be executed normally:The JSON file is incomplete")
            break
        end
    end
    vccnet.KeyofMessage      = temp[1]
    vccnet.ProtocolofMessage = temp[2]
    vccnet.RootAddress       = temp[3]
    
    -- 初始化网络
    if not modem == peripheral.find("modem") then
        FalatPrint ("[WebInit] cannot be executed normally:No modem attached")
    end
    if not rednet.isOpen("modem") then
        FalatPrint ("[WebInit] cannot be executed normally:Failed to open the rednet")
        return false
    end

    -- 向根服务器获取uid
    if not rednet.send(vccnet.RootAddress, vccnet.KeyofMessage.."_"..vccnet.ulable.."_INIT", vccnet.ProtocolofMessage) then
        FalatPrint ("[WebInit] cannot be executed normally:Failed to send the INIT message to the Root Server")
    end
    for i = 1, 4 do
        local id, MSG = rednet.receive(vccnet.ProtocolofMessage, 4)
        if id == vccnet.RootAddress then
            vccnet.uid = MSG
            return true
        end
    end

    FalatPrint ("[WebInit] cannot be executed normally:Failed to connect to the Root Server")
    iofeedback ("This Computer will be shut down")
    return false
end



vccnet.ConnectionCheck = function()
    if not rednet.isopen("modem") then
        FalatPrint ("Failed to open the rednet, please check the modem")
        iofeedback ("This Computer will be shut down")
        return false
    end

    rednet.send(vccnet.RootAddress, vccnet.KeyofMessage.."_"..vccnet.ulable.."_CHECK", vccnet.ProtocolofMessage)
    for i = 1, 4 do
        local id, MSG = rednet.receive(vccnet.ProtocolofMessage, 1)
        if id == vccnet.RootAddress then
            vccnet.uid = MSG
            return true
        end
    end

    FalatPrint ("[WebInit] cannot be executed normally:Failed to connect to the Root Server")
    iofeedback ("This Computer will be shut down")
    return false
end



vccnet.Send = function(gid, MSG)
    if not rednet.send(gid, vccnet.KeyofMessage.."_"..vccnet.ulable.."_"..MSG, vccnet.ProtocolofMessage) then
        FalatPrint ("[WebSend] cannot be executed normally:Failed to send the message to Computer NO."..gid)
    end
    --parallel.waitForAny(WaitForNet, vccnet.RootReceive)
    return nil
end



vccnet.Receive = function(gid)
    while true do
        local id, ret = rednet.receive(vccnet.ProtocolofMessage, 0.05)
        if id == gid then
            return ret
        end
    end
end



vccnet.RootSend = function(MSG)
    if not rednet.send(vccnet.RootAddress, vccnet.KeyofMessage.."_"..vccnet.ulable.."_"..MSG, vccnet.ProtocolofMessage) then
        FalatPrint ("[WebSend] cannot be executed normally:Failed to send the message to the Root Server")
    end
end



vccnet.RootReceive = function()
    while true do
        local id, ret = rednet.receive(vccnet.ProtocolofMessage, 0.05)
        if id == vccnet.RootAddress then
            return ret
        end
    end
end



return vccnet
