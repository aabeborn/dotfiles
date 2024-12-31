return {
	{ 
		"williamboman/mason.nvim",
		config = function()
			require('mason').setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls", -- Typescript language server
					"html", -- Html language server
					"tailwindcss", -- TailwindCss syntax support
					"cssls", -- Css language server
					"jsonls", -- Json language server
					"rust_analyzer", -- Rust language server
					"volar", -- Vue language server
                    "eslint", -- Eslint
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lsp_config = require("lspconfig")
			lsp_config.lua_ls.setup({})
			lsp_config.ts_ls.setup({})
			lsp_config.tailwindcss.setup({})
			lsp_config.jsonls.setup({})
			lsp_config.volar.setup({})

			-- Keymaps
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
		end,
	},
}
