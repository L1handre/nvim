require("config.lazy")
vim.g.mapleader = " "

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.cmd.colorscheme("tokyonight")

vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = {
		current_line = true,
	},
})

vim.opt.shortmess:append("C")
vim.opt.shortmess:append("S")
vim.opt.shortmess:append("c")
vim.opt.shortmess:append("s")

-- Treesitter
require("nvim-treesitter").install({ "lua", "javascript", "typescript", "python", "tsx", "go", "html", "css", "scss" })
