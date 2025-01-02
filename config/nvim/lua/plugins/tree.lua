return {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- disable netrw
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require("nvim-tree").setup({
            view = {
                relativenumber = true,
                side = "right",
                width = 40,
            },
            renderer = {
                indent_markers = {
                    enable = false,
                },
                icons = {
                    show = {
                        file = false,
                        folder_arrow = true,
                    },
                    git_placement = "after",
                    glyphs = {
                        default = "",
                        folder = {
                            default = "",
                            open = "",
                            empty = "",
                            empty_open = "",
                        },
                    },
                },
            },
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
            filters = {
                custom = { ".DS_Store", "node_modules", ".next", ".git", "build", "dist" },
            },
            git = {
                ignore = false,
            },
        })

        -- Keymaps
        vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
        vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
        vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
        vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
    end,
}