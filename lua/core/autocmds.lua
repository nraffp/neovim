vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*.md',
    callback = function()
        vim.api.nvim_command("setlocal spell spelllang=en_us")
    end,
})

