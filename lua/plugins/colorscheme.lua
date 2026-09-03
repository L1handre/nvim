local schemes = {
	"tokyonight-night",
	"tokyonight-storm",
	"tokyonight-day",
	"tokyonight-moon",
}

local function cycle_schemes(do_backwards)
	do_backwards = do_backwards or false

	local scheme_map = {}

	for i = 1, #schemes do
		scheme_map[schemes[i]] = i
	end

	local current_scheme = vim.g.colors_name
	local current_index = scheme_map[current_scheme]

	if not do_backwards then
		if current_index ~= #schemes then
			vim.cmd.colorscheme(schemes[current_index + 1])
		else
			vim.cmd.colorscheme(schemes[1])
		end
	else
		if current_index ~= 1 then
			vim.cmd.colorscheme(schemes[current_index - 1])
		else
			vim.cmd.colorscheme(schemes[#schemes])
		end
	end
	vim.notify("Current colorscheme: " .. vim.g.colors_name, vim.log.levels.INFO, { title = "Colorscheme" })
end

return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	keys = {
		{
			"<leader>z",
			cycle_schemes,
			desc = "Next color scheme",
		},
		{
			"<leader>Z",
			function()
				cycle_schemes(true)
			end,
			desc = "Previous color scheme",
		},
	},
}
