--VCC_eco   stdio.lua
--2024 / 5 / 15     17:14:55





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

--file end