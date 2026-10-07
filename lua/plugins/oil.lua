return {
	"stevearc/oil.nvim",
	opts = {
		default_file_explorer = false,
		delete_to_trash = true,
		keymaps = {
			["<C-p>"] = false,
			["`"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
		},
		watch_for_changes = true,
	},
	dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },
	lazy = false,
	keys = {
		{ "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
	},
}
