--VCC_eco   TaskManager.lua
--2025 / 2 / 10     13:57:24     Collinor



local ProcessesList = {}    -- 进程列表

local Registry = {}         -- 注册表

-------------------- 功能函数初始化 --------------------
CreateProcess = function (env, path, appname, ...)
    if not fs.exists(path) then
        -- 报错
        return nil
    end
    math.randomseed(os.epoch())
    local port = math.random(65535)
    while ProcessesList[port] do
        math.randomseed(os.epoch())
        port = math.random(65535)
    end

    ProcessesList[port] = {
        status = "r",   -- r:running, u:unknown, f:finished
        env = env,
        path = path,
        appname = appname,
        timer = 15
    }

    Registry[#Registry+1] = port

    os.run(env, path, port, appname, ...)

    return port
end

local refreahProcess = function (Port)
    ProcessesList[Port].timer = 15
    ProcessesList[Port].status = "r"
end

PostMessage = function(Port, MSG, dPort, dIP)
    if not ProcessesList[Port] then
        return nil
    end
    refreahProcess(Port)
    table.insert(ProcessesList, {dIP, dPort, MSG})
    return true
end

PostQuitMessage = function (Port)
    if not ProcessesList[Port] then
        return nil
    end
    ProcessesList[Port].status = "f"
    return true
end

GetMessage = function (Port)
    if not ProcessesList[Port] then
        return nil
    end
    refreahProcess(Port)
    return table.remove(ProcessesList[Port], 1)
end

GetProcessList = function ()
    local ret = {}
    for i, v in ipairs(Registry) do
        ret[i] = ProcessesList[v].appname
    end
    return ret
end



-------------------- 系统进程 --------------------
local _SYS_ = {-- Port, Path, AppName, Args
    {math.random(65535), "VCC/SYS/TaskManager.lua", "TaskManager"},
    -- Device
    {nil, "VCC/Driver/ModemDriver.lua", "ModemDriver"},
    {nil, "VCC/Driver/DisplayDriver.lua", "DisplayDriver"},
}

for i = 2, #_SYS_ do
    _SYS_[i][1] = CreateProcess({}, _SYS_[i][2], _SYS_[i][3])
end

GetPort = function (Port, dname)
    for _, v in ipairs(_SYS_) do
        if Port == v[1] then
            for _, w in ipairs(Registry) do
                if ProcessesList[w].appname == dname then
                    return w
                end
            end
        end
    end
    return nil
end



-------------------- 进程状态检查 --------------------
while true do
    for i, port in ipairs(Registry) do
        if ProcessesList[port].status == "u" then
            -- 报错 异常退出
            ProcessesList[port] = nil
            table.remove(Registry, i)
        elseif ProcessesList[port].status == "r" then
            ProcessesList[port].status = "u"
        elseif ProcessesList[port].status == "f" then

            ProcessesList[port] = nil
            table.remove(Registry, i)
        end
    end
end