return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({})
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>sc', builtin.git_files, {})
        vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>ss', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>sw', builtin.grep_string, {})
        vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
    end
}
