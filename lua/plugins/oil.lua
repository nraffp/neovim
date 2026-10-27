return {
    "stevearc/oil.nvim",
    enabled = true,
    config = function(_, opts)
        local oil = require("oil")
        oil.setup(opts)
        vim.keymap.set("n", "<leader>e", oil.open, { noremap = true, silent = true })
    end,
    opts = {
        skip_confirm_for_simple_edits = true,
        prompt_save_on_select_new_entry = false,
        default_file_explorer = true,
        use_default_keymaps = false,
        columns = {},
        watch_for_changes = true,
        keymaps = {
            ["q"] = "actions.close",
            ["<enter>"] = "actions.select",
            ["<bs>"] = "actions.parent",
            ["<leader>r"] = "actions.refresh",
            ["<leader>y"] = "actions.yank_entry",
            ["<leader>h"] = "actions.show_help",
            ["-"] = "actions.open_cwd",
        },
    },
}
