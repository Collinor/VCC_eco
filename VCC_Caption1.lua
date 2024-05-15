--VCC_eco   VCC_Caption1.lua
--2024 / 5 / 9     19:10:25



require ("stdio")
require ("function")

MSG = ""



while true do
    io.input (string.lower(MSG))

    if MSG == "" then
        if ErrorPrint ("The Message is NULL!") then
            LogPrint ("False!")
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

SystemPrint ("MessageWhile has ended!/n")

--file end