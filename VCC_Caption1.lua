--VCC_eco   VCC_Caption1.lua
--2024 / 5 / 9     19:10:25     Collinor



require ("stdio")
require ("function")



MSG = ""
Ln = 0



--
--init
 if peripheral.isPresent ("top") then
    top = peripheral.wrap ("top")
    else goto EndWhile
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

SystemPrint ("MessageWhile has ended!/n")

--file end