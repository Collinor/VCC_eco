--VCC_eco   VCC_Caption1
--2024 / 5 / 9     19:10:25



MSG = ""



function SystemPrint (string)
    print ("<System> ", string, "/n")
    return true   
end

function ErrorPrint (string)
    print ("<Error> ", string, "/n")
    return true   
end

function LogPrint (string)
    print ("[", os.time(), "]", string, "/n")
    return true   
end



for i = 1, 999, 1 do
    io.input (MSG)

    if MSG == "" then
        if ErrorPrint ("The Message is NULL!") then
            print ("False!/n")
        end
    end

    if MSG == "" then
        SystemPrint ("")        
    end


end

print ("<System> MessageWhile has ended!/n")
