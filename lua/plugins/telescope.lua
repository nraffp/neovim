local map = vim.keymap.set
local M = { "nvim-telescope/telescope.nvim" }

M.config = function()
    require("telescope").setup({
        defaults = {
            layout_strategy = "flex",
            layout_config = {
                flip_columns = 250,
            },
            mappings = {
                i = {
                    ["<esc>"] = "close",
                },
            },
        },
    })
    map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { noremap = true })
    map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { noremap = true })
    map("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>", { noremap = true })
end

return M
