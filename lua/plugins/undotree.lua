return {
  "mbbill/undotree",
  init = function ()
    vim.g.undotree_DiffCommand = "FC"
  end,
  keys = {
    { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle UndoTree" }
  }
}
