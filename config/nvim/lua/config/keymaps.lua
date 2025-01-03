-- Override LazyVim options
local map = LazyVim.safe_keymap_set

map("n", "<C-++>", "<cmd>resize +2<CR>", { desc = "Increase window size" })
map("n", "<C--->", "<cmd>resize -2<CR>", { desc = "Decrease window size" })
map("n", "<C-+++>", "<cmd>vertical resize +2<CR>", { desc = "Increase window size vertically" })
map("n", "<C---->", "<cmd>vertical resize -2<CR>", { desc = "Decrease window size vertically" })

-- Personal keymap
map("n", "n", "nzzzv", { desc = "Center next search result" })
map("n", "N", "Nzzzv", { desc = "Center previous search result" })
map(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Start a global search and replace" }
)

map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>sx", "<C-w>c", { desc = "Close current split" })
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>sw", "<C-w>", { desc = "Switch between windows" })

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
