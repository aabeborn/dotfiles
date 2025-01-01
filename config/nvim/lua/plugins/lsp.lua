return {

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "ts_ls",
                    "tailwindcss",
                    "volar",
                    "rust_analyzer",
                    "html",
                    "cssls"
                },
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,
                },
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf, silent = true }
                    -- Keymaps
                    opts.desc = "Show LSP references"
                    vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
                    opts.desc = "Go to declaration"
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    opts.desc = "Show LSP definitions"
                    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
                    opts.desc = "ShowLSP implementations"
                    vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
                    opts.desc = "Show LSP type definitions"
                    vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
                    opts.desc = "See available code actions"
                    vim.keymap.set({ "n", "v", }, "<leader>ca", vim.lsp.buf.code_action, opts)
                    opts.desc = "Smart rename"
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                    opts.desc = "Show buffer diagnostics"
                    vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
                    opts.desc = "Show line diagnostics"
                    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
                    opts.desc = "Go to previous diagnostics"
                    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
                    opts.desc = "Go to next diagnostics"
                    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
                    opts.desc = "Show docs for what is under the cursor"
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    opts.desc = "Restart LSP"
                    vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
                end,
            })

            local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end
        end,
    },
}
