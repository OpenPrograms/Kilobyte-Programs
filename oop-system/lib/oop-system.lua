local oop = {}

function oop.class(name)
    local ret = {_name = name}
    ret.__index = ret
    ret.new = function (...)
        local obj = setmetatable({}, ret)
        if ret.init then
            obj:init(...)
        end
        return obj
    end
    return ret
end

function oop.enum(a1, a2)
    local values, name
    if type(a1) == 'string' then
        name = a1
        values = a2
    else
        name = a2
        values = a1
    end
    local ret = {_name = name}
    for i = 1, #values do
        local v = values[i]
        ret[i] = v
        ret[v] = i
    end
    return ret
end

return oop