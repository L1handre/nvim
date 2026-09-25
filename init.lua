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
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
vim.g.neovide_floating_shadow = false

vim.keymap.set("n", "K", function()
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

vim.api.nvim_create_augroup("disable_muted_text_for_diagnostic_unnecessary", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
	group = "disable_muted_text_for_diagnostic_unnecessary",
	callback = function()
		vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", {})
	end,
})

vim.cmd.colorscheme("tokyonight-moon")
vim.keymap.set("n", "<leader>bd", "<CMD>bd!<CR>", { desc = "Kill Buffer" })
