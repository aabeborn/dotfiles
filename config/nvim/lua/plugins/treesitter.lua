return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
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
				sync_install = false,
				auto_install = true,
				indent = {
					enable = true,
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = { "markdown" },
				},
			})
		end,
	},
}
