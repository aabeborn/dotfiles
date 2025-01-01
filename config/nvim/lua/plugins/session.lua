return {
    "rmagatti/auto-session",
    config = function()
        require("auto-session").setup({
            auto_restore_enabled = false,
            auto_session_suppress_dir = { "~/", "~/Downloads", "~/Desktop", "~/Documents" },
        })

        vim.keymap.set( "n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for current working directory" })
        vim.keymap.set( "n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for current working directory" })
    end,
}

