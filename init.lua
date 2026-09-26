require("config.lazy")

vim.g.mapleader = " "
vim.g.neovide_floating_shadow = false

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.fileformats = { "unix", "dos" }

vim.diagnostic.config({
	virtual_text = true,
})

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

local map = vim.keymap.set

map("n", "<leader>w", "<C-w>")
map("n", "<leader>bd", "<CMD>bd!<CR>", { desc = "Kill Buffer" })
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

map("n", "K", function()
	vim.lsp.buf.hover({
		-- Top-left, top, top-right, right, bottom-right, bottom, bottom-left, left
		border = { " ", " ", " ", " ", " ", " ", " ", " " },
		max_width = 80,
		max_height = 20,
	})
end, { desc = "LSP Hover with Invisible Padding" })

vim.api.nvim_create_augroup("remove_neotree_win_separator", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
	group = "remove_neotree_win_separator",
	callback = function()
		local highlight = vim.api.nvim_get_hl(0, { name = "Normal" })
		vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { bg = highlight.bg, fg = highlight.bg })
	end,
})

vim.api.nvim_create_augroup("unmute_text_for_diagnostic_unnecessary", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
	group = "unmute_text_for_diagnostic_unnecessary",
	callback = function()
		vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", {})
	end,
})

vim.cmd.colorscheme("tokyonight-moon")
