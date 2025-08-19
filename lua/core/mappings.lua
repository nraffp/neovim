-- Better Indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", ">", ">gv")

-- Yanking
vim.keymap.set({ "n" }, "<leader>yy", '"+yy', { noremap = true, silent = true })
vim.keymap.set({ "v" }, "<leader>y", '"+y', { noremap = true, silent = true })

-- Moving lines
vim.keymap.set({ "v" }, "J", ":m '>+1<cr>gv=gv", { noremap = true, silent = true })
vim.keymap.set({ "v" }, "K", ":m '<-2<cr>gv=gv", { noremap = true, silent = true })

-- pasting
vim.keymap.set({ "n" }, "<leader>p", '"+[p', { noremap = true, silent = true })

-- Buffers
vim.keymap.set("n", "<leader>bs", "<cmd>source %<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>br", "<cmd>e<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bo", "<cmd>silent !open %<CR>", { noremap = true, silent = true })

-- Auto-centering next
vim.keymap.set("n", "n", "nzz", { noremap = true, silent = true })
vim.keymap.set("n", "N", "Nzz", { noremap = true, silent = true })

-- Sick backspace map
vim.keymap.set("n", "<bs>", "<C-^>", { noremap = true, silent = true })

-- Window Switching
for i = 1, 9 do
    vim.keymap.set("n", "<leader>" .. i, function()
        set_win_by_number(i)
    end)
end

-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true })

vim.keymap.set("n", "<leader>k", vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>F", require("core.formatter").format)
