return {
  {  -- icon support
    "echasnovski/mini.icons",
    config = true,
    lazy = true,
    specs = {
      { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
    },
    init = function() -- tricky hack by folke to use as nvim_web_devicons https://www.reddit.com/r/neovim/comments/1duf3w7/miniicons_general_icon_provider_several/
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },
  {  -- show marks
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {
      default_mappings = true,
    },
  },
  { -- highlight TODO comments
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true,
    lazy = false,
    keys = {
      { "<leader>fo", "<cmd>TodoTelescope<cr>", desc = "Telescope TODOs (Todo-comments)" },
      { "<leader>vo", "<cmd>TodoLocList<cr>", desc = "Show TODOs (Todo-comments)" },
    },
    opts = {
      keywords = {
        FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
        TEMP = { icon = " ", color = "error", alt = { "TMP", "REMOVEME", "DELETEME" } },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = "祥", color = "default", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        IDEA = { icon = " ", color = "default", alt = {} },
        HMM = { icon = " ", color = "default", alt = { "QUESTION" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
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
