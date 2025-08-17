local function file_name()
    return table.concat({
        "%#FileComponent#",
        " ", vim.fn.expand("%:."), " ",
        "%m",
    })
end

function winbar()
    return table.concat({
        file_name(),
    })
end

vim.opt.winbar = "%{%v:lua.winbar()%}"
