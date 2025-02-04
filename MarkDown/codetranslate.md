# codetranslate

这个库包含了VCC_eco内部的所有通讯代码, 以及对外开放的API.

该库的所有函数都被定义在 **_G** 表当中, 包含一个本地表codelist用于存储指令(directive)和代码(code)的对应关系.

| 函数名 | 描述 |
| ------ | ---- |
| [getdirective(code)](https://github.com/Collinor/VCC_eco/blob/main/MarkDown/codetranslate.md#getdirectivecode) | 获取传入代码对应的指令 |
| [getcode(directive)](https://github.com/Collinor/VCC_eco/blob/main/MarkDown/codetranslate.md#getcodedirective) | 获取传入指令对应的代码 |
| [findcode(directive)](https://github.com/Collinor/VCC_eco/blob/main/MarkDown/codetranslate.md#findcodedirective) | 获取传入指令对应的代码 |
| [addcode(directive, [code])](https://github.com/Collinor/VCC_eco/blob/main/MarkDown/codetranslate.md#addcodedirective-code) | 向指令表的用户自定义区域中添加指令和代码的对应关系 |
| [delcode(code)](https://github.com/Collinor/VCC_eco/blob/main/MarkDown/codetranslate.md#delcodecode) | 从指令表的用户自定义区域中删除指令和代码的对应关系 |

---

## getdirective(code)

这个函数用于获取传入代码对应的指令, 并返回指令的内容.

> input

* code: number 要查找的代码

> return

* directive: string 指令的内容

* nil 如果传入代码没有对应的指令

---

## getcode(directive)

这个函数用于获取传入指令对应的代码, 并返回代码.

> input

* directive: string 要查找的指令

> return

* code: number 指令对应的第一个代码

* nil 如果传入指令没有对应的代码

---

## findcode(directive)

这个函数用于获取传入指令对应的代码, 并返回代码. **仅适用于Lua5.3及以上**

> input

* directive: string 要查找的指令

> return

* code: number 指令对应的第一个代码

* nil 如果传入指令没有对应的代码

---

## addcode(directive, [code)

这个函数用于向指令表的用户自定义区域中添加指令和代码的对应关系.

其中, directive可以是任何类型的值, 但code必须是number类型.

> input

* directive: string 要添加的指令

* code: number 指令对应的代码

> return

* code: number 最终该指令对应的代码

如果该directive已存在, 则返回第一个相同directive的code;

如果code已被占用, 则返回codelist中用户自定义区域的第一个空闲的code;

如果未指定code, 则返回codelist中用户自定义区域的第一个空闲的code.

---

## delcode(code)

这个函数用于从指令表的用户自定义区域中删除指令和代码的对应关系.

> input

* code: number 要删除的指令对应的代码

> return

* code: number 被删除的代码

* nil 如果传入代码没有在用户自定义区域中
