local args = table.pack(...)

local file = args[1]
local code = args[2]

local usbx = require('ubersandbox')

local sbx = usbx.Sandbox.new(file)

if code then
    print(sbx:eval(code))
else
    while true do
        print(sbx:eval(io.read()))
    end
end