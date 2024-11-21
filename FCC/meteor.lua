--VCC_eco   fc-s1.lua -> meteor.lua
--2024 / 11 / 18     20:43:04     Collinor



local state = {{nil, 0, 0, 0},{0, 0, 0, 0},{0, 0, 0, 0}}

local destination
destination.x = io.read()
destination.y = io.read()
destination.z = io.read()



WebInit()

local LaunchPoint
LaunchPoint.x, LaunchPoint.y, LaunchPoint.z = gps.locate(0.1)

redstone.setAnalogOutput("bottom", 15)

while redstone.getOutput("bottom") do
    local x, y, z = gps.locate(0.1)
    if  y > 260 then
        break
    end
    sleep(0.1)
end

redstone.setOutput("bottom", false)

