return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		require("snacks").setup({
			notifier = {
				enabled = true,
				timeout = 3000,
			},
			input = {
				enabled = true,
			},
			dashboard = {
				enabled = true,
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
		})

		-- Keymaps
		vim.keymap.set("n", "<leader>gg", function()
			Snacks.lazygit()
		end, { desc = "Open Lazygit" })
		vim.keymap.set("n", "<leader>z", function()
			Snacks.zen()
		end, { desc = "Toggle Zen Mode" })
		vim.keymap.set({ "n", "v" }, "<leader>gB", function()
			Snacks.gitbrowse()
		end, { desc = "Git Browse" })
		vim.keymap.set("n", "<leader>gb", function()
			Snacks.gitblame_line()
		end, { desc = "Git Blame Line" })
		vim.keymap.set("n", "<leader>gf", function()
			Snacks.lazygit.log_file()
		end, { desc = "Lazygit current file" })
		vim.keymap.set("n", "<leader>un", function()
			Snacks.notifier.hide()
		end, { desc = "Dismiss all notifications" })
	end,
}
