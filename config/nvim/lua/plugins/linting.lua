return {
	"mfussenegger/nvim-lint",
	opts = {
		events = { "BufWritePost", "BufReadPost", "InsertLeave" },
		linters_by_ft = {
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescript = { "eslint_d" },
			typescriptreacst = { "eslint_d" },
			vue = { "eslint_d" },
			svelte = { "eslint_d" },
			markdown = { "markdownlint" },
		},
	},
}
