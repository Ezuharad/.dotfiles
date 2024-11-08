-- highlight TODO comments
return {
  "folke/todo-comments.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
  config = true,
  lazy = false,
  keys = {
    { "<leader>fo", "<cmd>TodoTelescope<cr>", desc = "Telescope TODOs (Todo-comments)", },
    { "<leader>vo", "<cmd>TodoLocList<cr>", desc = "Show TODOs (Todo-comments)", }
  },
  opts = {
    keywords = {
      FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
      TEMP = { icon = " ", color = "error", alt = { "TMP", "REMOVEME", "DELETEME" } },
      TODO = { icon = " ", color = "info" },
      HACK = { icon = " ", color = "warning" },
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = "祥", color = "default", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      IDEA = { icon = " ", color = "default", alt = { } },
      HMM = { icon = " ", color = "default", alt = { "QUESTION" } },
      NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
      TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
  },
}

-- FIX:
-- TODO:
-- HACK:
-- WARN:
-- PERF:
-- NOTE:
-- TEST:
-- IDEA:
-- HMM:
