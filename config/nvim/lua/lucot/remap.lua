-- remaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)   -- back to project view
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")    -- move highlighted block down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")    -- move highlighted block up
vim.keymap.set("x", "<leader>p", [["_dP]])      -- keep last yank
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
