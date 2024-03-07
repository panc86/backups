require("catppuccin").setup {
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false
}

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
