return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local nvimtree = require("nvim-tree")

        vim.g.loaded_netrw = 1
        vim.g.loaded_netwrPlugin = 1

        nvimtree.setup({
            view = {
                width = 40,
                relativenumber = true,
                side = "right",
            },
            renderer = {
                indent_markers = {
                    enable = true
                },
                icons = {
                    show = {
                        folder_arrow = true,
                        file = false
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
                custom = {
                    ".DS_Store",
                    "node_modules",
                },
            },
            git = {
                ignore = false,
            },
        })

        -- Keymaps
        vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
        vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>",
            { desc = "Toggle file explorer on current file" })
        vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
        vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
    end,
}
