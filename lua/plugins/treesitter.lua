return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    opts = {
        playground = {
            enable = true,
            disable = {},
            updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
            persist_queries = false, -- Whether the query persists across vim sessions
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                },
                selection_modes = {
                    ["@parameter.outer"] = "v",
                    ["@function.outer"] = "V",
                    ["@class.outer"] = "<c-v>",
                },
                include_surrounding_whitespace = true,
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]"] = { query = "@class.outer", desc = "Next class start" },
                    ["]o"] = "@loop.*",
                    ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                    ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer",
                },
                goto_next = {
                    ["]d"] = "@conditional.outer",
                },
                goto_previous = {
                    ["[d"] = "@conditional.outer",
                },
            },
        },
        highlight = { enable = true, additional_vim_regex_highlighting = false },
        indent = { enable = true },
        context_commentstring = { enable = true, enable_autocmd = false },
        ensure_installed = {
            "svelte",
            "bash",
            "html",
            "javascript",
            "json",
            "astro",
            "lua",
            "go",
            "gomod",
            "gosum",
            "gowork",
            "markdown",
            "markdown_inline",
            "toml",
            "python",
            "query",
            "regex",
            "tsx",
            "typescript",
            "vim",
            "yaml",
            "rust",
            "css",
            "gitcommit",
            "vimdoc",
            "templ",
            "proto",
            "typst",
            "sql",
            "cpp",
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-space>",
                node_incremental = "<C-space>",
                scope_incremental = "<nop>",
                node_decremental = "<bs>",
            },
        },
    },
    config = function(plugin, opts)
        if plugin.ensure_installed then
            require("lazyvim.util").deprecate("treesitter.ensure_installed", "treesitter.opts.ensure_installed")
        end
        require("nvim-treesitter.configs").setup(opts)

        -- Hide all semantic highlights because it is current overriding highlights in a manner I don't like
        -- TODO: Find a better solution to this because semantic highlighting can be useful for lsp
        for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
            vim.api.nvim_set_hl(0, group, {})
        end

        vim.filetype.add({
            extension = {
                templ = "templ",
            },
        })
        -- local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()

        -- -- This configures the parser for templ files (A go templating language)
        -- treesitter_parser_config.templ = {
        --     install_info = {
        --         url = "https://github.com/vrischmann/tree-sitter-templ.git",
        --         files = { "src/parser.c", "src/scanner.c" },
        --         branch = "master",
        --     },
        -- }
        -- vim.treesitter.language.register("templ", "templ")
    end,
}
