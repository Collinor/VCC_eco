--VCC_eco   VCC_Caption1.lua
--2024 / 5 / 9     19:10:25     Collinor



--require ("stdio")
require ("function")



MSG = ""
MSGLog = {"reroot", ""}
local pLn = 1



--
--init
 if peripheral.isPresent ("top") then
    top = peripheral.wrap ("top")
    else goto EndWhile
 end



--
--sdtio
top.setTextColor (colors.Black)
function SystemPrint (string)
    top.setBackgroundColor (colors.lightGray)
    print ("System ")
    top.setBackgroundColor (colors.White)
    print (string)

    return true
end

function ErrorPrint (string)
    top.setBackgroundColor (colors.yellow)
    print (" Error ")
    top.setBackgroundColor (colors.White)
    print (string)

    return true
end

function WarnPrint (string)
    top.setBackgroundColor (colors.orange)
    print ("Warning")
    top.setBackgroundColor (colors.White)
    print (string)

    return true
end

function FalsePrint (string)
    top.setBackgroundColor (colors.red)
    print (" False ")
    top.setBackgroundColor (colors.White)
    print (string)  

    return true
end



while true do
    io.input (string.lower(MSG))

    if MSG == "" then
        if ErrorPrint ("The Message is NULL!") then
            SystemPrint ("False!")
        end
        goto continue
    end

    if MSG == "help" then
        HelpPrint ("")
    end




    if MSG == "shutdown" or "exit" then
        break
    end

    ::continue::
end

::EndWhile::

FalsePrint ("MessageWhile has ended!\n")

--file end