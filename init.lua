require("config.lazy")
vim.g.mapleader = " "

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.diagnostic.config({
	virtual_text = true,
	-- virtual_lines = {
	-- 	current_line = true,
	-- },
})

vim.cmd.colorscheme("tokyonight-moon")

require("vim._core.ui2").enable({
	enable = true,
	msg = {
		targets = "cmd",
		dialog = {
			height = 0.5,
		},
		msg = {
			height = 0.5,
		},
		pager = {
			height = 0.999,
		},
	},
})

vim.keymap.set("n", "<leader>w", "<C-w>")
vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { fg = "NONE" })
vim.g.neovide_floating_shadow = false
