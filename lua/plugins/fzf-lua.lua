return {
    url = "https://gitlab.com/ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        "max-perf",
        winopts = {
            fullscreen = true,
            border = "single",
        },
        file_ignore_patterns = { "/opt/homebrew/", "node_modules/", "target/" },
        files = {
            previewer = false,
            cwd_prompt = false,
            find_opts = "-type f",
        },
        buffers = {
            previewer = false,
        },
    },

    config = function(_, opts)
        local map = vim.keymap.set
        require("fzf-lua").setup(opts)
    end,
}
