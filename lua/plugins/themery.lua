return {
	"zaldih/themery.nvim",
	lazy = false,
	keys = {
		{ "<leader>z", "<CMD>Themery<CR>", desc = "Open theme browser" },
	},
	config = function()
		require("themery").setup({
			themes = vim.fn.getcompletion("", "color"),
			livePreview = true,
			themeConfigFile = "c:\\v:null",
		})
	end,
}
