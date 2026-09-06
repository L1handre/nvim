return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
	opts = {
		filesystem = {
			follow_current_file = {
				enabled = true,
				leave_dirs_open = false,
			},
			window = {
				-- position = "right",
				width = 30,
			},
			default_component_configs = {
				git_status = {
				},
			},
		},
	},
}
