require("config.lazy")
vim.g.mapleader = " "

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.cmd.colorscheme("tokyonight")

-- Treesitter
require("nvim-treesitter").install({ "lua", "javascript", "typescript", "tsx", "go", "html", "css", "scss" })

vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = {
		current_line = true,
	},
})
