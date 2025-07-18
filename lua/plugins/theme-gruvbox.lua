return {
    "sainnhe/gruvbox-material",
    lazy = true,
    init = function()
        vim.g.gruvbox_material_background = "hard"
    end,
    config = function()
        vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "gruvbox-material",
            callback = function()
                vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
            end,
        })
    end,
    priority = 1000
}
