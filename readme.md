# VCC_eco

## IO

### Cmdio

```Lua

```

### Logio

#### SystemPrint

```Lua
function SystemPrint (string)
    top.blit (CmdTime, colors.gray, colors.white)
    top.blit ("System ", colors.black, colors.lightGray)
    top.blit (string.."\n", colors.black, colors.white)
    MSGLog[LogLn] = {0, false, string.."\n"}
    LogLn = LogLn + 1

    return true
end
```

#### WarnPrint

```Lua
function WarnPrint (string)
    top.blit (CmdTime, colors.gray, colors.white)
    top.blit ("Warning", colors.black, colors.yellow)
    top.blit (string.."\n", colors.black, colors.white)
    MSGLog[LogLn] = {1, false, string.."\n"}
    LogLn = LogLn + 1

    return true
end
```

#### ErrorPrint

```Lua
function ErrorPrint (string)
    top.blit (CmdTime, colors.yellow, colors.white)
    top.blit (" Error ", colors.black, colors.orange)
    top.blit (string.."\n", colors.black, colors.white)
    MSGLog[LogLn] = {2, false, string.."\n"}
    LogLn = LogLn + 1

    return true
end
```

#### FalatPrint

```Lua
function FalatPrint (string)
    top.blit (CmdTime, colors.orange, colors.white)
    top.blit (" Falat ", colors.white, colors.red)
    top.blit (string.."\n", colors.black, colors.white)
    MSGLog[LogLn] = {3, true, string.."\n"}
    LogLn = LogLn + 1
    MSG = "False"

    return true
end
```

## Net

## Code Deployment

### Capitals

#### Plant Management Sys

### Communication Servers

#### Root Servers

#### Node Servers


### Forewarn System

### War Command Sys
