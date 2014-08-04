# Config Parser Library

An option is a keyword, followed by any amount of whitespace seperated arguments and optionally a block. if no block is supplied, the option has to be terminated with a semicolon

Example options:

```
foo bar; # with 1 argument
debug;   # no arguments
```

Examples with blocks:

```
do {
    stuff;
}

filter mystuff {
    hello world;
}
```

How to use lua side:

```lua
local cfgparse = require('configparse')
local file = io.open("my.cfg")
local data = cfgparse.parse(file:read('*a'))
file:close()

for opt in data:each() do
    print("Option found: "..opt.name)
end

print("---")

for opt in data:each("myopt") do
    print(opt.args[1])
    for opt_ in opt.sub:each() do
        print(" -> "..opt_.name)
    end
end
```

This code on this config...

```
hello world;
myopt test {
    abc;
    def;
}
```

...would yield this output...

```
Option found: hello
Option found: myopt
---
test
 -> abc
 -> def
```
