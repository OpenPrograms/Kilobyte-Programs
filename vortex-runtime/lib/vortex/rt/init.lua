--[[ Vortex 0.1 runtime init module

 Author: q66 <quaker66@gmail.com>
 Initializes all the runtime modules.
]]

local M = require "vortex/rt/core"
require "vortex/rt/env"
require "vortex/rt/table"
require "vortex/rt/list"
require "vortex/rt/seq"
require "vortex/rt/object"
require "vortex/rt/parser"
require "vortex/rt/defenv"
require "vortex/rt/mod"

return M
