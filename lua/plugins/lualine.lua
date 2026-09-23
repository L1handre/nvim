local empty_extension = {
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	filetypes = { "neo-tree" },
}

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
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
				-- {
				-- 	require("noice").api.status.mode.get,
				-- 	cond = function()
				-- 		return require("noice").api.status.mode.has()
				-- 			and string.match(require("noice").api.status.mode.get(), "recording") ~= nil
				-- 	end,
				-- },
				-- {
				-- 	require("noice").api.status.command.get,
				-- 	cond = require("noice").api.status.command.has,
				-- },
			},
		},
		extensions = {
			empty_extension,
		},
	},
}
