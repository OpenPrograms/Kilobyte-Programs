local __e9ew_rt = require("rt_init")
local _ENV = __e9ew_rt.__vx_def_env
local __q1e9_rtfn = __e9ew_rt.__vx_tonum
local __u5iw_rtfn = __e9ew_rt.__vx_error
local __ykms_rtfn = __e9ew_rt.__vx_select
local rawget = raw_get
local rawset = raw_set
local __ew3g_expr = debug
local getinfo = __ew3g_expr[([[getinfo]])]
local error = error
local select = select
local mt = {

}
local __ew3s_arg = _G
set_mt(__ew3s_arg, mt)
local __3gqk_expr = mt
__3gqk_expr[([[__gdecl]])] = {

}
local what = function()
    do
        local __a5yo_let = getinfo(3, ([[S]]))
        local info = __a5yo_let
        if info then
            local __iwqo_expr = info
            return __iwqo_expr[([[what]])]
        else
            return ([[C]])
        end
    end
end
local __35uo_expr = mt
__35uo_expr[([[__newindex]])] = function(self, n, v)
    local __uc7w_expr = mt
    local __a5mk_expr = __uc7w_expr[([[__gdecl]])]
    if (not __a5mk_expr[n]) then
        if (what() ~= ([[C]])) then
            error((([[assignment to undeclared variable ']]) .. (n .. ([[']]))))
        end
        local __7oyw_expr = mt
        local __75yg_expr = __7oyw_expr[([[__gdecl]])]
        __75yg_expr[n] = true
    end
    local __esq1_arg = self
    local __uw39_arg = n
    rawset(__esq1_arg, __uw39_arg, v)
end
local __7w71_expr = mt
__7w71_expr[([[__index]])] = function(self, n)
    local __akak_expr = mt
    local __71ik_expr = __akak_expr[([[__gdecl]])]
    if ((not __71ik_expr[n]) and (what() ~= ([[C]]))) then
        error((([[access to undeclared variable ']]) .. (n .. ([[']]))))
    end
    local __3kqs_arg = self
    return rawget(__3kqs_arg, n)
end
local __qou9_expr = _R
__qou9_expr[([[__vx_gdecl]])] = function(...)
    do
        local __uwyc_expr = mt
        local gdecl = __uwyc_expr[([[__gdecl]])]
        do
            local __asi9_var, __3g79_lim, __yoeg_step = __q1e9_rtfn(1), __q1e9_rtfn(select(([[#]]), __ykms_rtfn(1, ...))), __q1e9_rtfn(1)
            if (__asi9_var == nil) then
                __u5iw_rtfn("'for' initial value must be a number")
            end
            if (__3g79_lim == nil) then
                __u5iw_rtfn("'for' limit must be a number")
            end
            if (__yoeg_step == nil) then
                __u5iw_rtfn("'for' step must be a number")
            end
            ::__mgig_lbl_beg::
            if (not (((__yoeg_step > 0) and (__asi9_var <= __3g79_lim)) or ((__yoeg_step <= 0) and (__asi9_var >= __3g79_lim)))) then
                goto __mgig_lbl_end
            end
            local i = __asi9_var
            local __y5mw_expr = gdecl
            local __ysy5_arg = i
            __y5mw_expr[select(__ysy5_arg, __ykms_rtfn(1, ...))] = true
            ::__mgig_lbl_inc::
            __asi9_var = (__asi9_var + __yoeg_step)
            goto __mgig_lbl_beg
            ::__mgig_lbl_end::
        end
    end
end