local core_modules = {
    "core.settings",
    "core.mappings",
    "core.statusline",
    "core.winbar",
    "core.autocmds",
    "core.formatter",
    "core.lsp",
}

for _, module in ipairs(core_modules) do
    local ok, err = pcall(require, module)
    if not ok then
        error("Something went wrong loading" .. module .. "\n" .. err)
    end
end

-- Given a window number, set the current window to that number.
function set_win_by_number(win_number)
    local win_id = vim.api.nvim_list_wins()[win_number]
    vim.api.nvim_set_current_win(win_id)
end
