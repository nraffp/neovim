#INTERVAL

local map = vim.keymap.set
-- Better Indenting
map("v", "<", "<gv")
map("v", ">", ">gv")
map("v", ">", ">gv")

-- Yanking
map({ "n" }, "<leader>yy", '"+yy', { noremap = true, silent = true })
map({ "v" }, "<leader>y", '"+y', { noremap = true, silent = true })

-- Moving lines
-- map({ "i" }, "<C-j>", "<esc>:m .+1<CR>==i", { noremap = true, silent = true })
-- map({ "i" }, "<c-k>", "<esc>:m .-2<cr>==i", { noremap = true, silent = true })
map({ "v" }, "J", ":m '>+1<cr>gv=gv", { noremap = true, silent = true })
map({ "v" }, "K", ":m '<-2<cr>gv=gv", { noremap = true, silent = true })

-- pasting
-- map({ "v", "n" }, "p", "p==^", { noremap = true, silent = true })
-- map({ "v", "n" }, "<S-p>", "[p", { noremap = true, silent = true })
map({ "n" }, "<leader>p", '"+[p', { noremap = true, silent = true })
-- map({ "v", "n" }, "<leader><S-p>", '"*[p', { noremap = true, silent = true })

-- Buffers
map("n", "<leader>bs", "<cmd>source %<CR>", { noremap = true, silent = true })
map("n", "<leader>br", "<cmd>e<CR>", { noremap = true, silent = true })
map("n", "<leader>bo", "<cmd>silent !open %<CR>", { noremap = true, silent = true })

-- Auto-centering next
map("n", "n", "nzz", { noremap = true, silent = true })
map("n", "N", "Nzz", { noremap = true, silent = true })

-- Sick backspace map
map("n", "<bs>", "<C-^>", { noremap = true, silent = true })

-- Window Switching
for i = 1, 9 do
    vim.keymap.set("n", "<leader>" .. i, function()
        set_win_by_number(i)
    end)
end

map("n", "<leader>k", vim.diagnostic.open_float, { noremap = true, silent = true })
map("n", "<leader>F", require("core.formatter").format)
