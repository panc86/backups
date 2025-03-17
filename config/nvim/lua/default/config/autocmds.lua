-- specify commands to be executed automatically when reading or writing
-- a file, when entering or leaving a buffer or window, and when exiting vim
-- source: https://neovim.io/doc/user/autocmd.html
local BaseGroup = vim.api.nvim_create_augroup("Base", {})

-- highlight yanks
vim.api.nvim_create_autocmd("TextYankPost", {
	group = BaseGroup,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 40 })
	end,
})

-- resize window
vim.api.nvim_create_autocmd({ "VimResized" }, {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})
