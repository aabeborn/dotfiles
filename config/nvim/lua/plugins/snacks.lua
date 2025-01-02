return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		notifier = {
			enabled = true,
			timeout = 3000,
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
	},
	config = function()
		-- Keymaps with better organization and error handling
        local function safe_snacks_call(fn, ...)
            local status_ok, result = pcall(fn, ...)
            if not status_ok then
                vim.notify("Snacks error: " .. tostring(result), vim.log.levels.ERROR)
            end
        end

		local keymap_opts = { silent = true, noremap = true }

        -- Git operations
        vim.keymap.set("n", "<leader>gg", function()
            safe_snacks_call(Snacks.lazygit)
        end, vim.tbl_extend("force", keymap_opts, { desc = "Open Lazygit" }))

        vim.keymap.set({ "n", "v" }, "<leader>gB", function()
            safe_snacks_call(Snacks.gitbrowse)
        end, vim.tbl_extend("force", keymap_opts, { desc = "Git Browse" }))

        vim.keymap.set("n", "<leader>gb", function()
            safe_snacks_call(Snacks.gitblame_line)
        end, vim.tbl_extend("force", keymap_opts, { desc = "Git Blame Line" }))

        vim.keymap.set("n", "<leader>gf", function()
            safe_snacks_call(Snacks.lazygit.log_file)
        end, vim.tbl_extend("force", keymap_opts, { desc = "Lazygit current file" }))

        -- UI operations
        vim.keymap.set("n", "<leader>z", function()
            safe_snacks_call(Snacks.zen)
        end, vim.tbl_extend("force", keymap_opts, { desc = "Toggle Zen Mode" }))

        vim.keymap.set("n", "<leader>un", function()
            safe_snacks_call(Snacks.notifier.hide)
        end, vim.tbl_extend("force", keymap_opts, { desc = "Dismiss all notifications" }))
	end,
}
