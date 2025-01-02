return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = { focus = true },
    cmd = "Trouble",
    keys = {
        { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
        { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics" },
        { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols" },
        { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP" },
        { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List" },
        { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List" },
        { "[t", "<cmd>Trouble next skip_groups=false jump=true<CR>", desc = "Next Issue" },
        { "]t", "<cmd>Trouble previous skip_groups=false jump=true<CR>", desc = "Previous Issue" },
    },
}