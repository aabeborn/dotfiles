return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "moon",
				dark_variant = "moon",
			})
		end,
	},
	{
		"mellow-theme/mellow.nvim",
	},
	{
		"rebelot/kanagawa.nvim",
	},
	{
		"LazyVim/LazyVim",
		opts = {
			-- colorscheme = "rose-pine",
			colorscheme = "rose-pine",
		},
	},
}
