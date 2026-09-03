return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			on_open = function(term)
				if term.direction == "vertical" then
					vim.cmd("wincmd H")
					vim.cmd("vertical resize 40")
				end
			end,
		},
		keys = {
			{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle Float Terminal" },
			{ "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle Horizontal Terminal" },
			{ "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Toggle Vertical Terminal" },
			{
				"<leader>ts",
				function()
					local id = vim.v.count
					if id == 0 then
						local input = vim.fn.input("Switch to Terminal ID: ")
						id = tonumber(input)
					end

					if id then
						require("toggleterm").toggle(id)
					end
				end,
				desc = "Switch Terminal ID",
			},
		},
	},
}
