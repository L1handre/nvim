return {
  'nvim-telescope/telescope.nvim', version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    {'<C-p>', require("telescope.builtin").find_files},
    {'<leader>fg', require("telescope.builtin").live_grep}
  }
}
