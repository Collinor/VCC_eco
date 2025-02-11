--VCC_eco   webio.lua -> ModemDevice.lua -> ModemDriver.lua
--2024 / 10 / 30     20:18:56     Collinor



tArgs = {...}

local modem = nil


-------------------- ModemDevice 初始化 --------------------
local vccnet =
{
    cid                     = os.getComputerID() -- 计算机ID
}

-- 从JSON文件中读入设置
if not fs.exists("VCC/web/init.json") then
    FalatPrint ("[ModemDevice] cannot be executed normally:No profile")
    return nil
end
local file = fs.open("VCC/web/init.json", "r")
local temp = {}
while true do
    temp[#temp+1] = file.readLine()
    if not temp[#temp] then
        FalatPrint ("[ModemDevice] cannot be executed normally:The profile is incomplete")
        break
    end
end
vccnet.IP                   = temp[1] -- IP地址
vccnet.NetworkLevel         = temp[2] -- 网络等级
vccnet.NetworkProtocol      = temp[3] -- 网络协议
vccnet.ParentServerID       = temp[4] -- 父服务器ID
    
-- 初始化网络
if not modem == peripheral.find("modem", rednet.open) then
    FalatPrint ("[ModemDevice] cannot be executed normally:No modem attached")
    return nil
end
if not rednet.isOpen("modem") then
    FalatPrint ("[ModemDevice] cannot be executed normally:Failed to open the rednet")
    return nil
end

-- 向根服务器获取uid
if not rednet.send(vccnet.RootAddress, vccnet.KeyofMessage.."_"..vccnet.ulable.."_INIT", vccnet.NetworkProtocol) then
    FalatPrint ("[ModemDevice] cannot be executed normally:Failed to send the INIT message to the Root Server")
end
for i = 1, 4 do
    local id, MSG = rednet.receive(vccnet.NetworkProtocol, 4)
    if id == vccnet.RootAddress then
        vccnet.uid = MSG
        return true
    end
end

FalatPrint ("[ModemDevice] cannot be executed normally:Failed to connect to the Root Server")
console.write ("This Computer will be shut down")



-------------------- ModemDevice 功能函数 --------------------

-- 卸载网络
vccnet.UninstallNetwork = function()
    rednet.close()
    vccnet = nil
    return not vccnet
end

vccnet.ConnectionCheck = function()
    if not rednet.isopen("modem") then
        FalatPrint ("Failed to open the rednet, please check the modem")
        console.write ("This Computer will be shut down")
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

    FalatPrint ("[ModemDevice] cannot be executed normally:Failed to connect to the Root Server")
    console.write ("This Computer will be shut down")
    return false
end



vccnet.Send = function(Port, DIP, DPort, Code, MSG) -- Destination
    local msg = {}
    msg[1] = string.char(unpack(vccnet.IP)) -- 4B
    msg[2] = string.char(unpack(Port))      -- 2B
    msg[3] = string.char(unpack(DIP))       -- 4B
    msg[4] = string.char(unpack(DPort))     -- 2B
    msg[5] = string.char(unpack(Code))      -- 2B
    msg[6] = MSG                            -- NB
    
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
        FalatPrint ("[ModemDevice] cannot be executed normally:Failed to send the message to the Root Server")
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



-------------------- 公共端口 --------------------
VCCNET = {
    lIP = vccnet.IP,
}