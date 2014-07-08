local class = require('oop-system').class

local Whitelist = class('Whitelist')

function Whitelist:init()
    self.stuff = {}
end

function Whitelist:isAllowed(what)
    return self.all or self.stuff[what]
end

function Whitelist:permit(...)
    local args = table.pack(...)
    if args.n < 1 then
        self.all = true
    else
        for k = 1, args.n do
            --checkArg(k, args[k], 'string')
            self.stuff[args[k]] = true
        end
    end
    return self
end

return Whitelist