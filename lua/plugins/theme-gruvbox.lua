return {
    "sainnhe/gruvbox-material",
    lazy = true,
    init = function()
        vim.g.gruvbox_material_background = "hard"
        vim.g.gruvbox_material_transparent_background = 1
    end,
    config = function()
        vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "gruvbox-material",
            callback = function()
                local utils = require("core.utils")
                utils.update_hl("NormalFloat", { bg = "none" })
                utils.update_hl("FloatBorder", { bg = "none" })
                utils.update_hl("Winbar", { bg = "none" })
                utils.update_hl("WinbarNC", { bg = "none" })
            end,
        })
    end,
    priority = 1000
}
