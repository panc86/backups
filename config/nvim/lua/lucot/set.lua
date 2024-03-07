-- leader is SPACE
vim.g.mapleader = " "

-- consisten cursor style N/I modes
vim.opt.guicursor = ""

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- history backup
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- incremental search highlighting
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- cursor to EOF buffer
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- allow @ char in filenames
vim.opt.isfname:append("@-@")

-- fast updates
vim.opt.updatetime = 50

-- show column margin
vim.opt.colorcolumn = "80"
