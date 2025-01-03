return {
	"folke/snacks.nvim",
	opts = {
		dashboard = {
			sections = {
				{
					pane = 1,
					{
						section = "terminal",
						cmd = "ascii-image-converter ~/.config/nvim/welcome.png -C -c",
						height = 30,
						gap = 16,
						random = 10,
					},
					{ section = "keys", gap = 1, padding = 1 },
					{ section = "startup" },
				},
			},
		},
	},
}
