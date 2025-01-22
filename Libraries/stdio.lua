--VCC_eco   stdio.lua
--2024 / 5 / 15     17:14:55     Collinor



console =
{
    status = nil,
    Cursor = {1, 1}
}



console.write = function (code, color, x, y)
    if color then term.setTextColor(color) end
    if x and y then term.setCursorPos(
        x, y) end

    return true
end

console.writeText = function (string, color, x, y)

end

console.writeLine = function (string, color, Ln)

end

console.clear = function ()

end

console.refresh = function ()

end

console.Select = function (stratx, starty, endx, endy)
    
end

function WaitForNet()
    sleep (4)
    return true
end
