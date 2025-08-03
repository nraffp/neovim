local ENABLED_LSP_SERVERS = {
    "gopls",
    "marksman",
    "html",
    "ts_ls",
    "clangd",
    "rust_analyzer",
    "lua_ls",
}

for _, server in pairs(ENABLED_LSP_SERVERS) do
    vim.lsp.enable(server)
end

vim.diagnostic.config({
    float = { border = "single" },
    signs = { severity_sort = true, priority = 2 },
    underline = false,
    update_in_insert = true,
    severity_sort = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end

        -- Confgure LSP formatting if the server is able to.
        if client:supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWrite", {
                group = vim.api.nvim_create_augroup("formatting.lsp." .. client.name, { clear = false }),
                buffer = args.buf,
                callback = function()
                    if vim.g.format_on_save then
                        vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                    end
                end,
            })
        end
    end
})

vim.api.nvim_create_autocmd("LspDetach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end

        -- Remove formatting auto commands
        local auto_cmds = vim.api.nvim_get_autocmds({
            buffer = args.buf,
            group = "formatting.lsp." .. client.name,
        })
        for _, auto_cmd in pairs(auto_cmds) do
            vim.api.nvim_del_autocmd(auto_cmd.id)
        end
    end,
})
