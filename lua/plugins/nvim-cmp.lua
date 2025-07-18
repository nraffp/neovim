return {
    "hrsh7th/nvim-cmp" ,
    event = "InsertEnter",
    config = function()
        local cmp = require("cmp")

        vim.opt.completeopt = { "menu", "menuone", "noselect" }

        local opts = {
            formatting = {
                format = function(_, vim_item)
                    vim_item.menu = ""
                    return vim_item
                end,
            },
            window = {
                -- completion = cmp.config.window.bordered({ border = {"┌","─","┐","│","┘","─","└","│"}}),
                completion = cmp.config.window.bordered({ border = "single" }),
                documentation = cmp.config.window.bordered(),
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<C-CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
            }),
        }

        cmp.setup(opts)
    end,
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
}
