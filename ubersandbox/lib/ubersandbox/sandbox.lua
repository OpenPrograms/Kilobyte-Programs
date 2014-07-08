local class = require('oop-system').class

local Sandbox = class('Sandbox')
local cfg = require('configparse')
local Require = require('ubersandbox/require')

function Sandbox:init(file)
    self.cfgfile = file
    self:reloadConfig()
    self:reset()
end

function Sandbox:reloadConfig()
    local f = io.open(self.cfgfile)
    local data = f:read('*a')
    f:close()
    self.config = cfg.parse(data)
    self.require = Require.new(self)

    for el in self.config:each('api') do
        local wl = self.require:whitelist(el.args[1])
        if el.sub then
            for e in el.sub:each('permit') do
                wl:permit(e.args[1])
            end
        else
            wl:permit()
        end
    end

end

function Sandbox:reset()
    local t = {}
    self._G = t
    t._G = t

    for el in self.config:each('preload') do
        self.require:preload(el.args[1])
    end
end

function Sandbox:eval(code, args, source, mode)
    local func, err = load(code, source or 'eval', mode or 't', self._G)
    if not func then
        return nil, err
    end
    local t = coroutine.create(func)
    return coroutine.resume(t, table.unpack(args or {}))
end

return Sandbox