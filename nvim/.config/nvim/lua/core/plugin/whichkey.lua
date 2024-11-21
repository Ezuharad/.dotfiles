-- pane to show keymaps when keys are used
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>f", group = "Telescope" },
      { "<leader>d", group = "Debug" },
      { "<leader>g", group = "Git" },
      { "<leader>gf", group = "Telescope Pickers" },
      { "<leader>gv", group = "Git Misc." },
      { "<leader>p", group = "AI" },
      { "<leader>r", group = "Code Actions" },
      { "<leader>v", group = "Misc. UIs" },
    },
    win = {
      border = "rounded",
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Local Buffer Keymaps",
    },
  },
}
