--[[ Vortex 0.1 parser access module

 Author: q66 <quaker66@gmail.com>
 Available under the terms of the MIT license.
]]

if _G["rt_parser"] then
    require("vortex/rt/core").__vx_parser = _G["rt_parser"]
else
    local core = require("vortex/rt/core")
    _G["rt_core"] = core
    core.__vx_parser = require("vortex/parser")
    _G["rt_core"] = nil
end
