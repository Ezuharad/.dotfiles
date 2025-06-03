-- pane to show keymaps when keys are used
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "gr", group = "Code Actions" },
      { "gra", group = "Code Actions" },
      { "grn", group = "Rename Symbol" },
      { "grr", group = "Go to References" },
      { "gri", group = "Go to Implementations" },
      { "gO", group = "Document Symbol" },
      { "<leader>a", group = "AI", mode = { "n", "v" } },
      { "<leader>f", group = "Telescope" },
      { "<leader>d", group = "Debug" },
      { "<leader>g", group = "Git" },
      { "<leader>gf", group = "Telescope Pickers" },
      { "<leader>gv", group = "Git Misc." },
      { "<leader>r", group = "Code Actions" },
      { "<leader>v", group = "Misc. UIs" },
      { "<leader>x", group = "Diagnostics (Trouble)" }
    },
    win = {
      border = vim.g.config.theme.border.float_border,
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
