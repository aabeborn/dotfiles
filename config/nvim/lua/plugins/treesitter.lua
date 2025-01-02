return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "vimdoc",
                    "javascript",
                    "typescript",
                    "lua",
                    "rust",
                    "comment",
                    "gitignore",
                    "json",
                    "markdown",
                    "css",
                    "tsx",
                    "html",
                    "bash",
                    "svelte",
                    "vue",
                    "c",
                },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = { "markdown" },
                },
				auto_install = true,
                indent = { enable = true },
            })
        end,
    },
}
