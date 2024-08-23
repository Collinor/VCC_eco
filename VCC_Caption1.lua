--VCC_eco   VCC_Caption1.lua
--2024 / 5 / 9     19:10:25     Collinor



--require ("stdio")
require ("function")



MSG = ""
MSGLog = {{0, 0, 0, ""}}

local pLn = 1



--
--init
 if peripheral.isPresent ("top") then
    top = peripheral.wrap ("top")
    else goto EndWhile
 end



--
--stdio
top.setTextColor (colors.Black)
function SystemPrint (string)
    top.blit ("System ", colors.black, colors.lightGray)
    top.blit (string, colors.black, colors.white)
    print ("\n")

    return true
end

function ErrorPrint (string)
    top.blit (" Error ", colors.black, colors.yellow)
    top.blit (string, colors.black, colors.white)
    print ("\n")

    return true
end

function WarnPrint (string)
    top.blit ("Warning", colors.black, colors.orange)
    top.blit (string, colors.black, colors.white)
    print ("\n")

    return true
end

function FalsePrint (string)
    top.blit (" False ", colors.white, colors.red)
    top.blit (string, colors.black, colors.white)
    print ("\n")

    return true
end



while true do
    
    if MSG == "False" then break end

    MSG = io.read ()

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