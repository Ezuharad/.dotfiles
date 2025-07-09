-- tree-visualization for nonlinear undo operations
return {
  "mbbill/undotree",
  lazy = true,
  enabled = false,
  cmd = "UndotreeToggle",
  keys = {
    { "<leader>vu", "<cmd>UndotreeToggle<cr>", desc = "Undo Tree (Undotree)" },
  },
}
