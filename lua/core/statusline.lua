local modes = {
    ["n"] =     { str = "NORMAL", hlgroup = "ViModeComponentNormal" },
    ["no"] =    { str = "NORMAL", hlgroup = "ViModeComponentNormal" },
    ["v"] =     { str = "VISUAL", hlgroup = "ViModeComponentVisual" },
    ["V"] =     { str = "V-LINE", hlgroup = "ViModeComponentVisualLine" },
    ["i"] =     { str = "INSERT", hlgroup = "ViModeComponentInsert" },
    ["ic"] =    { str = "INSERT", hlgroup = "ViModeComponentInsert" },
    ["c"] =     { str = "CMD-LN", hlgroup = "ViModeComponentCmd" },
    [""] =    { str = "V-BLCK", hlgroup = "ViModeComponentVisualBlock" },
    ["s"] =     { str = "SELECT", hlgroup = "ViModeComponentSelect" },
    ["S"] =     { str = "S-LINE", hlgroup = "ViModeComponentSelectLine" },
    [""] =    { str = "S-BLCK", hlgroup = "ViModeComponentSelectBlock" },
    ["r"] =     { str = "PROMPT", hlgroup = "ViModeComponentPrompt" },
    ["t"] =     { str = "TERMINAL", hlgroup = "ViModeComponentTerm" },
}
local function mode()
    local mode = modes[vim.api.nvim_get_mode().mode]

    if not mode then
        return ""
    end

    return table.concat({
        "%#",
        mode.hlgroup,
        "#",
        " ",
        mode.str,
        " ",
        "%# StatusLine #",
    })
end

local function pwd()
    local cwd =vim.fn.fnamemodify(vim.loop.cwd(), ":~")

    return table.concat({
        "%#PwdComponent# ",cwd
    })
end

function statusline()
    return table.concat({
        mode(),
        pwd(),
        "%# StatusLine #",
    })
end

vim.opt.statusline = "%{%v:lua.statusline()%}"
