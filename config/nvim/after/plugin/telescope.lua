local builtin = require('telescope.builtin')
-- find all files
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- find only files in git
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- regex file search
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
