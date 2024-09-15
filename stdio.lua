--VCC_eco   stdio.lua
--2024 / 5 / 15     17:14:55     Collinor



WarnPoint = {0, 0}

function SystemPrint (string)
    print ("System ")
    return true
end



function ErrorPrint (string)
    print (" Error ")
    return true
end



function WarnPrint (string)
    print ("Warning")
    return true
end



function FalsePrint (string)
    print (" False ")
    return true
end



function HTTPStream (uid, string)
    
    return true
end



function MapInit ()
    top.setbackgroundColor (colors.blue)
    top.clear()
    top.blit ("", colors.black, colors.red)
    return true
end

--file end