-- Shorten function name
local keymap = vim.keymap.set

-- explorer
keymap("n", "<leader>.", vim.cmd.Ex, { silent = true, noremap = true, desc = "back to project view" })

-- move text
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "move highlighted block down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "move highlighted block up" })

-- yank text
keymap("x", "<leader>p", [["_dP]], { desc = "Delete and paste (keep clipboard)" })
keymap({ "n", "v" }, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])

-- window navigation
keymap({ "n", "v", "i" }, "<C-h>", "<C-w>h", {
	desc = "Navigate window left",
})
keymap({ "n", "v", "i" }, "<C-j>", "<C-w>j", {
	desc = "Navigate window down",
})
keymap({ "n", "v", "i" }, "<C-k>", "<C-w>k", {
	desc = "Navigate window up",
})
keymap({ "n", "v", "i" }, "<C-l>", "<C-w>l", {
	desc = "Navigate window right",
})

-- save changes
keymap("n", "<leader>w", "<cmd>update!<cr>", { desc = "Save" })
