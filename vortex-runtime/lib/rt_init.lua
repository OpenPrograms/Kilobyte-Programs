--[[ Vortex 0.1 runtime initialization module

 Author: q66 <quaker66@gmail.com>
 Available under the terms of the MIT license.
]]

local rt = require "vortex/rt"
-- set only here - in "standalone" rt loader; for macro
-- expansion and so on, it's done from inside the compiler
--rt.__vx_env_set(3, rt.__vx_def_env)
return rt
