--VCC_eco   stdio.lua
--2024 / 5 / 15     17:14:55     Collinor



local console =
{
    status = nil
}



console.write = function (string)
    print("<"..console.status..">"..string)
    return true
end



function WaitForNet()
    sleep (4)
    return true
end

return console
