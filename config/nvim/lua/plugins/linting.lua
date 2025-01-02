return {
    "mfussenegger/nvim-lint",
	dependencies = {
        "mason.nvim", 
    },
	event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            typescriptreact = { "eslint_d" },
            svelte = { "eslint_d" },
            vue = { "eslint_d" },
         	markdown = { "markdownlint" },
        }

        -- Configure eslint_d
        lint.linters.eslint_d.args = {
            '--no-warn-ignored', -- Reduces noise from .gitignored files
            '--format', 'json',
            '--stdin',
            '--stdin-filename', function()
                return vim.api.nvim_buf_get_name(0)
            end
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                -- Debounce linting to prevent excessive calls
                local timer = vim.loop.new_timer()
                timer:start(100, 0, vim.schedule_wrap(function()
                    lint.try_lint()
                end))
            end,
        })

        -- Keymaps
        vim.keymap.set("n", "<leader>l", function()
            lint.try_lint()
        end, { desc = "Trigger linting for current file" })

        -- Optional: Add a keymap to show lint errors
        vim.keymap.set("n", "<leader>ls", function()
            vim.diagnostic.setloclist()
        end, { desc = "Show lint errors in location list" })

    end,
}