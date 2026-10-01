return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	opts = {},
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
