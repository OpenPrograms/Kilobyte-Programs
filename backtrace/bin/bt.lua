local args = table.pack(...)

local f, m = loadfile(args[1])
if not f then
    io.stderr:write("Could not load lua: "..m.."\n")
    return 1
end

local ret
local s, m = xpcall(function()
    ret = f(table.unpack(args, 2))
end, function(...)
    io.stderr:write(debug.traceback()..'\n')
    print(...)
end)
if not s and m then
    io.stderr:write(m..'\n')
end
return ret