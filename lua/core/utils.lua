local M = {}
---
--- Updates the highlight with the provided highlight options.
--- Unlike vim.api.nvim_get_hl, this function does does replace the entire highlight.
---
--- @param opts vim.api.keyset.highlight
--- @param hl string
function M.update_hl(hl, opts)
    local hl_old = vim.api.nvim_get_hl(0, { name = hl })
    vim.api.nvim_set_hl(0, hl, vim.tbl_extend("force", hl_old, opts))
end

return M
