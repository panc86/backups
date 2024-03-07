-- i.e. while in normal (n) mode, if ' 'pv, execute cmd
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- keep last yank
vim.keymap.set("x", "<leader>p", [["_dP]])
-- move highlighted in block (insert)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- yank to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
