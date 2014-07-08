return function (inp, cache)
    cache = cache or {}
    local t = type(inp)
    if t == 'string' or t == 'number' or t == 'function' or t == 'boolean' or t == 'nil' then
        return inp
    elseif t == 'userdata' then
        if cache[inp] then
            return cache[inp] -- no infinite recursion
        end
        local mt = getmetatable(inp)
        local ret
        if type(mt) == 'table' and mt.__clone then
            ret = mt.__clone(inp)
        else 
            ret = inp
        end
        cache[inp] = ret
        return ret
    elseif t == 'table' then
        if cache[inp] then
            return cache[inp] -- no infinite recursion
        end
        local mt = getmetatable(inp)
        local ret
        if type(mt) == 'table' and mt.__clone then
            ret = mt.__clone(inp)
            cache[inp] = ret
        else 
            ret = {}
            cache[inp] = ret
            for k, v in pairs(inp) do
                ret[deepcopy(k, cache)] = deepcopy(v, cache)
            end
        end
        return ret
    end
end
