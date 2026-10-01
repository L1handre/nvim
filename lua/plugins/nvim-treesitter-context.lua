return {
	"nvim-treesitter/nvim-treesitter-context",
	config = function()
		local ts_context_state = {
			bufnr = nil,
			topline = nil,
		}

		local function smart_treesitter_context_up()
			local current_bufnr = vim.api.nvim_get_current_buf()
			local current_topline = vim.fn.line("w0")

			if ts_context_state.bufnr == current_bufnr and ts_context_state.topline == current_topline then
				ts_context_state.bufnr = nil
				ts_context_state.topline = nil

				vim.api.nvim_feedkeys(vim.keycode("<C-o>"), "n", false)
				return
			end
			local line_before = vim.api.nvim_win_get_cursor(0)[1]

			require("treesitter-context").go_to_context(vim.v.count1)

			local line_after = vim.api.nvim_win_get_cursor(0)[1]

			if line_before ~= line_after then
				ts_context_state.bufnr = vim.api.nvim_get_current_buf()
				ts_context_state.topline = vim.fn.line("w0")
			else
				ts_context_state.bufnr = nil
				ts_context_state.topline = nil
			end
		end

		vim.keymap.set("n", "[u", smart_treesitter_context_up, {
			desc = "Smart Treesitter Context / Jump Back",
			silent = true,
		})
	end,
}
