--VCC_eco   DisplayDevice.lua -> DisplayDriver.lua
--2024 / 12 / 22     17:19:52     Collinor

tArgs = {...}

local displayer = {}

local monitor = peripheral.find("monitor")
displayer.width, displayer.height = monitor.getSize()

local Memory = {}

local WndQue = {
    [0] = {
        "Desktop",
        1, 1, displayer.width, displayer.height,
        port = tArgs[1]
    }
}


