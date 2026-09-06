return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			disabled_filetypes = { "neo-tree" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = {
				{
					"filename",
					separator = "",
				},
				{
					"%=",
					separator = "",
				},
				{
					function()
						local status = require("doing").status()
						if status == "Not doing any tasks" then
							return nil
						end
						return status
					end,
				},
			},
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = {
				"location",
				{
					require("noice").api.status.mode.get,
					cond = require("noice").api.status.mode.has,
				},
			},
		},
	},
}
