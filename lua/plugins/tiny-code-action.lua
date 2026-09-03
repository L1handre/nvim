return {
	"rachartier/tiny-code-action.nvim",
	dependencies = {},
	event = "LspAttach",
	opts = {
		picker = "buffer",
	},
	keys = {
		{
			"<leader>ca",
			function()
				require("tiny-code-action").code_action()
			end,
			mode = { "n", "x" },
		},
	},
}
