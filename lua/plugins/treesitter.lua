return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	opts = {
		indent = {
			enable = true,
		},
	},
	init = function()
		require("nvim-treesitter").install({
			"lua",
			"javascript",
			"typescript",
			"python",
			"tsx",
			"go",
			"html",
			"css",
			"scss",
		})
	end,
}
