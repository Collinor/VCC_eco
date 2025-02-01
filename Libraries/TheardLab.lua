--VCC_eco   TheardLab.lua
--2024 / 1 / 27     23:49:17     Collinor



Thread = {

}

Thread.getCurrent = function()
    return coroutine.running()
end