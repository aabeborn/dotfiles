return {
	{
		"github/copilot.vim",
		event = "VeryLazy",
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		cmd = "CopilotChat",
		build = "make tiktoken",
		opts = {
			window = {
				width = 0.3,
			},
		},
		keys = {
			{ "<leader>cct", ":CopilotChatToggle<CR>", desc = "Toggle Copilot Chat" },
			{
				"<leader>ccp",
				function()
					local actions = require("CopilotChat.actions")
					require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
				end,
				desc = "Copilot chat - Prompt actions",
			},
			{

				"<leader>ccq",
				function()
					local input = vim.fn.input("Quick chat: ")
					if input ~= "" then
						require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
					end
				end,
				desc = "Quick chat with Copilot",
			},
		},
	},
}
