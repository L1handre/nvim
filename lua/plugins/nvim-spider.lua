return {
	"chrisgrieser/nvim-spider",
	lazy = true,
	keys = {
		{ "]s", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
		{ "]S", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
		{ "[s", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
		{ "[S", "<cmd>lua require('spider').motion('ge')<CR>", mode = { "n", "o", "x" } },
	},
}
