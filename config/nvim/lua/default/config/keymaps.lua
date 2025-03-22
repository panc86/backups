-- Shorten function name
local keymap = vim.keymap.set

keymap("n", "<leader>.", vim.cmd.Ex, { silent = true, noremap = true, desc = "back to project view" })

-- move text
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "move highlighted block down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "move highlighted block up" })

-- yank text
keymap("x", "<leader>p", [["_dP]], { desc = "Delete and paste (keep clipboard)" })
keymap({ "n", "v" }, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])

-- Window navigation
vim.keymap.set({ "n", "v", "i" }, "<C-h>", "<C-w>h", {
	desc = "Navigate window left",
})
vim.keymap.set({ "n", "v", "i" }, "<C-j>", "<C-w>j", {
	desc = "Navigate window down",
})
vim.keymap.set({ "n", "v", "i" }, "<C-k>", "<C-w>k", {
	desc = "Navigate window up",
})
vim.keymap.set({ "n", "v", "i" }, "<C-l>", "<C-w>l", {
	desc = "Navigate window right",
})

-- save changes
vim.keymap.set("n", "<leader>w", "<cmd>update!<cr>", { desc = "Save" })
