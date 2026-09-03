return {
  "Hashino/doing.nvim",
  lazy = false,
  opts = {
    winbar = { enabled = false }
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "doing", "doing-edit" },
      callback = function(event)
	vim.keymap.set("n", "<Esc>", "<cmd>close<CR>", {
	  buffer = event.buf,
	  silent = true,
	  noremap = true,
	  desc = "Close doing window",
	})
      end,
    })
  end,
  keys = {
    { "<leader>da", function() require("doing").add() end, desc = "[D]oing: [A]dd", },
    { "<leader>dn", function() require("doing").done() end, desc = "[D]oing: Do[n]e", },
    { "<leader>de", function() require("doing").edit() end, desc = "[D]oing: [E]dit", },
  },
}
