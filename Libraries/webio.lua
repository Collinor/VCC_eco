--VCC_eco   webio.lua
--2024 / 10 / 30     20:18:56     Collinor




modem = nil



webio = 
{
    cid                 = os.getComputerID(),
    ulable              = os.getComputerLabel(),
    KeyofMessage        = nil,
    ProtocolofMessage   = nil,
    RootAddress         = nil,
    uid                 = nil
}



webio.Init = function()
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
    webio.KeyofMessage      = temp[1]
    webio.ProtocolofMessage = temp[2]
    webio.RootAddress       = temp[3]
    -- 初始化网络
    if not modem == peripheral.find("modem") then
        FalatPrint ("[WebInit] cannot be executed normally:No modem attached")
    end
    if not rednet.isOpen("modem") then
        FalatPrint ("[WebInit] cannot be executed normally:Failed to open the rednet")
        return false
    end
    -- 向根服务器获取uid
    if not rednet.send(webio.RootAddress, webio.KeyofMessage.."_"..webio.ulable.."_INIT", webio.ProtocolofMessage) then
        FalatPrint ("[WebInit] cannot be executed normally:Failed to send the INIT message to the Root Server")
    end
    for i = 1, 4 do
        local id, MSG = rednet.receive(webio.ProtocolofMessage, 4)
        if id == webio.RootAddress then
            webio.uid = MSG
            return true
        end
    end

    FalatPrint ("[WebInit] cannot be executed normally:Failed to connect to the Root Server")
    iofeedback ("This Computer will be shut down")
    return false
end



webio.ConnectionCheck = function()
    if not rednet.isopen("modem") then
        FalatPrint ("Failed to open the rednet, please check the modem")
        iofeedback ("This Computer will be shut down")
        return false
    end

    rednet.send(webio.RootAddress, webio.KeyofMessage.."_"..webio.ulable.."_CHECK", webio.ProtocolofMessage)
    for i = 1, 4 do
        local id, MSG = rednet.receive(webio.ProtocolofMessage, 1)
        if id == webio.RootAddress then
            webio.uid = MSG
            return true
        end
    end

    FalatPrint ("[WebInit] cannot be executed normally:Failed to connect to the Root Server")
    iofeedback ("This Computer will be shut down")
    return false
end



webio.Send = function(gid, MSG)
    if not rednet.send(webio.RootAddress, webio.KeyofMessage.."_"..webio.ulable.."_"..MSG, webio.ProtocolofMessage) then
        FalatPrint ("[WebSend] cannot be executed normally:Failed to send the message to the Root Server")
    end
    while true do
        local id, ret = rednet.receive(webio.ProtocolofMessage, 0.05)
        if id == gid then
            return ret
        end
    end
    return nil
end