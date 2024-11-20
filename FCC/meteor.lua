--VCC_eco   fc-s1.lua -> meteor.lua
--2024 / 11 / 18     20:43:04     Collinor



local state = {{nil, 0, 0, 0},{0, 0, 0, 0},{0, 0, 0, 0}}






WebInit()

local LaunchPoint
LaunchPoint.x, LaunchPoint.y, LaunchPoint.z = gps.locate(0.1)

redstone.setOutput("bottom", false)

while true do
    local x, y, z = gps.locate(0.1)
    if  y > 260 then
        break
    end
end

redstone.setOutput("bottom", true)