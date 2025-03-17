-- Shorten function name
local keymap = vim.keymap.set

-- Silent keymap option
local opts = { silent = true, noremap = true }

-- back to project view
keymap("n", "<leader>.", vim.cmd.Ex, opts)

-- move highlighted block down
keymap("v", "J", ":m '>+1<CR>gv=gv")

-- move highlighted block up
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- keep last yank
keymap("x", "<leader>p", [["_dP]])

keymap({ "n", "v" }, "<leader>y", [["+y]])

keymap("n", "<leader>Y", [["+Y]])
