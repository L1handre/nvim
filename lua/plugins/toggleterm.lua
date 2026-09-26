local function create_terminal(cmd, name)
	local toggleterm_terminal = require("toggleterm.terminal").Terminal
	local terminal = toggleterm_terminal:new({
		cmd = cmd,
		direction = "horizontal",
	})
	terminal.display_name = name
	return terminal
end

return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			open_mapping = [[<C-\>]],
			on_open = function(term)
				if term.direction == "vertical" then
					vim.cmd("wincmd H")
					vim.cmd("vertical resize 40")
				end
			end,
			winbar = {
				enabled = true,
				name_formatter = function(term)
					return (term.count or term.id)
						.. ":"
						.. (term.display_name or vim.fs.basename(vim.o.shell):gsub("%.[Ee][Xx][Ee]$", ""))
				end,
			},
		},
		keys = {
			{
				"<C-\\>",
				function()
					local count = vim.v.count1
					require("toggleterm").toggle(count)
				end,
				desc = "Toggle Terminal Window",
			},
			{
				"<leader>tc",
				function()
					local terminal = create_terminal("cmd", "cmd")
					terminal:toggle()
				end,
				desc = "Toggle cmd Terminal",
			},
			{
				"<leader>tg",
				function()
					local terminal = create_terminal("C:/PROGRA~1/Git/bin/bash.exe", "Git Bash")
					terminal:toggle()
				end,
				desc = "Toggle Git Bash Terminal",
			},
			{
				"<leader>tp",
				function()
					local terminal = create_terminal("powershell", "PowerShell")
					terminal:toggle()
				end,
				desc = "Toggle PowerShell Terminal",
			},
		},
	},
}
