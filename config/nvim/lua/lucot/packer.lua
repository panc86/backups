return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Fuzzy file search https://github.com/nvim-telescope/telescope.nvim
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                          , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- parser generator tool https://tree-sitter.github.io/
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}

	-- visualizes the undo history through undo branches https://github.com/mbbill/undotree
	use 'mbbill/undotree'
	-- git
	use 'tpope/vim-fugitive'

    -- warnings
    use {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
                -- empty to use the default settings
            }
        end,
    }

	-- lsp configuration
	use 'neovim/nvim-lspconfig'

	-- lsp installer
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'

    -- theme
    use {
        'catppuccin/nvim',
        as = 'catppuccin',
        config = function()
            vim.cmd('colorscheme catppuccin')
        end
    }

    -- completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'

end)
