--VCC_eco   function.lua
--2024 / 5 / 15     21:34:00     Collinor



Permissions = {{0, "Admin"}, {1, "User"}, {2, "Guest"}}

 localPermission = Permissions[1]



function FL(operation, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10)



    if operation == "quit" or "exit" then
        os.quit()
    end
    if operation == "add" then
        return p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8 + p9 + p10
    end
    if operation == "sub" then
        return p1 - p2 - p3 - p4 - p5 - p6 - p7 - p8 - p9 - p10
    end


    return true
end

--file end