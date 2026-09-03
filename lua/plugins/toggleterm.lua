return {
  {
    'akinsho/toggleterm.nvim',
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
    }
  }
}
