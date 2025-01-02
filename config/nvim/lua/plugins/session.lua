return {
    "rmagatti/auto-session",
    dependencies = {
        "nvim-telescope/telescope.nvim", -- For session-lens integration
    },
    event = "VimEnter",
    config = function()
        local function close_all_floating_wins()
            -- Close floating windows before saving session
            for _, win in ipairs(vim.api.nvim_list_wins()) do
                local config = vim.api.nvim_win_get_config(win)
                if config.relative ~= "" then
                    vim.api.nvim_win_close(win, false)
                end
            end
        end

        require("auto-session").setup({
            auto_restore_enabled = false,  -- Good choice for explicit control
            auto_session_suppress_dirs = { 
                "~/", 
                "~/Downloads", 
                "~/Desktop", 
                "~/Documents",
                -- Add these for development workflows
                "~/node_modules",
                "~/.git",
            },
            -- Add these features
            pre_save_cmds = {
                close_all_floating_wins,  -- Close floating windows before saving
                "tabdo NvimTreeClose", -- Close file tree in all tabs
            },
            save_extra_cmds = {
                "NvimTreeRefresh",  -- Refresh file tree after restore
            },
            -- Better session management
            log_level = "error",
            auto_session_create_enabled = false,  -- Explicit session creation
            session_lens = {
                -- Telescope load session integration
                load_on_setup = true,
                theme_conf = { border = true },
                previewer = false,
            },
        })

        -- Enhanced keymaps
        local keymap_opts = { silent = true, noremap = true }
        
        -- Original mappings
        vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", 
            vim.tbl_extend("force", keymap_opts, { desc = "Save session for cwd" }))
        vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", 
            vim.tbl_extend("force", keymap_opts, { desc = "Restore session for cwd" }))
        
        -- Additional useful mappings
        vim.keymap.set("n", "<leader>wd", "<cmd>SessionDelete<CR>", 
            vim.tbl_extend("force", keymap_opts, { desc = "Delete current session" }))
        vim.keymap.set("n", "<leader>wl", "<cmd>Telescope session-lens search_session<CR>", 
            vim.tbl_extend("force", keymap_opts, { desc = "List all sessions" }))
    end,
}