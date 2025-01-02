return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local builtin = require("telescope.builtin")

        require("telescope").setup({
            defaults = {
                file_ignore_patterns = {
                    "node_modules",
                    "build",
                    "dist",
                    "yarn.lock",
                    ".git",
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
                live_grep = {
                    additional_args = function()
                        return { "--hidden" }
                    end,
                },
            },
        })

        -- Keymaps
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files in cwd" })
        vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find files in git repo" })
        vim.keymap.set("n", "<leader>lg", builtin.live_grep, { desc = "Live grep in cwd" })
        vim.keymap.set("n", "<leader>pws", function()
            builtin.grep_string({ search = vim.fn.expand("<cword>") })
        end, { desc = "Search current word" })
        vim.keymap.set("n", "<leader>pWs", function()
            builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
        end, { desc = "Search current WORD" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find open buffers" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search help tags" })
    end,
}