return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
    "lua",
    "vim",
    "markdown",
    "javascript",
    "html",
    "css",
    "json",
    "yaml",
    "go",
    "python",
    "bash",
    "dockerfile",
},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
