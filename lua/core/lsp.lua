local ENABLED_LSP_SERVERS = {
    "gopls",
    "marksman",
    "html",
    "ts_ls",
    "clangd",
    "rust_analyzer",
    "lua_ls",
    "pyright"
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
            local format = require("core.formatter")
            format.attach_formatter(args.buf, client.name, {
                format = function(format_args)
                    vim.lsp.buf.format({ bufnr = format_args.bufnr, id = client.id })
                end
            })
        end
    end
})

vim.api.nvim_create_autocmd("LspDetach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end
        require("core.formatter").detach_formatter(args.buf, client.name)
    end,
})
