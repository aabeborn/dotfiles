vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.mouse = ''

local map = vim.keymap.set
local opts = { silent = true, noremap = true }

-- Visual mode mappings
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move block one line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move block one line up" })

-- Navigation
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half page" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half page" })
map("n", "n", "nzzzv", { desc = "Center next search result" })
map("n", "N", "Nzzzv", { desc = "Center previous search result" })

-- Search and Replace
map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], 
    { desc = "Start a global search and replace" })

-- Window Management
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
map("n", "<C-w>,", ":vertical resize -10<CR>", opts)
map("n", "<C-w>.", ":vertical resize +10<CR>", opts)
map("n", "<leader>qq", ":q<CR>", opts)

-- Tab Management
map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Clipboard Management
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Copy line to clipboard" })
map({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from clipboard" })
map({ "n", "v" }, "<leader>P", [["+P]], { desc = "Paste from clipboard before cursor" })
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without copying" })

-- Quick Exit
map("i", "<C-c>", "<Esc>", { desc = "Exit insert mode" })

-- Config
map("n", "<leader><leader>", function()
    vim.cmd("so")
end, { desc = "Source nvim config" })