return {
	"folke/edgy.nvim",
	event = "VeryLazy",
	opts = {
		animate = { enabled = false },
		wo = {
			winbar = false,
		},
		bottom = {
			-- toggleterm / lazyterm at the bottom with a height of 40% of the screen
			{
				ft = "toggleterm",
				size = { height = 0.3 },
				-- exclude floating windows
				filter = function(buf, win)
					return vim.api.nvim_win_get_config(win).relative == ""
				end,
				wo = {
					winhighlight = "",
				},
			},
			"Trouble",
			{ ft = "qf", title = "QuickFix" },
		},
		left = {
			{
				title = "Neo-Tree",
				ft = "neo-tree",
				-- filter = function(buf)
				-- 	return vim.b[buf].neo_tree_source == "filesystem"
				-- end,
			},
		},
		right = {
			{
				ft = "dbui",
				title = "DBUI",
				size = { width = 0.2 },
			},
			{
				ft = "help",
				size = { width = 0.4 },
				filter = function(buf)
					return vim.bo[buf].buftype == "help"
				end,
			},
		},
	},
}
