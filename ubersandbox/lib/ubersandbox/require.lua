local class = require('oop-system').class

local Require = class('Require')
local Whitelist = require('ubersandbox/whitelist')
local deepcopy = require('deepcopy')

function Require:init(sbx)
    self.sbx = sbx
    self.sbx._G = sbx
    self.white = {}
    self.apis = {}

    self:registerAPI('require', self)
end

function Require:whitelist(name)
    if not self.white[name] then
        self.white[name] = Whitelist.new()
    end

    return self.white[name]
end

function Require:isAllowed(module, element)
    if self.white[module] then
        if element then
            return self.white[name]:isAllowed(element)
        else
            return true
        end
    else
        return false
    end
end

function Require:registerAPI(name, object)
    self.apis[name] = object
    return self
end

function Require:load(name)
    if not self:isAllowed(name) then
        error("Access to API '"..name.."' denied")
    end
    if self.apis[name] then
        return self.apis[name]:makeAPI(self)
    end
    local ret = deepcopy(_G[name] or require(name))
    if type(ret) == 'table' then
        for k, v in pairs(ret) do
            if not self:isAllowed(name, k) then
                ret[k] = nil
            end
        end
    end
    return ret
end

function Require:makeAPI()
    return function(what)
        return self:load(what)
    end
end

function Require:preload(name)
    self.sbx._G[name] = self:load(name)
end

return Require