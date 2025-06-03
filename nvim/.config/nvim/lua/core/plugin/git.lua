-- git integration
return {
  {
    "lewis6991/gitsigns.nvim",
    config = true,
    lazy = true,
    keys = {
      { "<leader>gvs", "<cmd>Gitsigns toggle_signs<cr>",              desc = "Gitsigns (Gitsigns)" },
      { "<leader>gvb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Git Line Blame (Gitsigns)" },
      { "<leader>gvB", "<cmd>Gitsigns blame<cr>",                     desc = "Git File Blame (Gitsigns)" }
    },
    opts = {
      signcolumn = false,
      current_line_blame_opts = {
        delay = 10
      }
    }
  },
  {
    "sindrets/diffview.nvim",
    -- TODO:
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true,
    opts = {
      graph_style = "unicode",
      kind = "floating",
    },
    keys = {
      { "<leader>gb", "<cmd>Neogit branch<cr>", desc = "Git Branch (Neogit)" },
      { "<leader>gd", "<cmd>Neogit diff<cr>",   desc = "Git Diff (Neogit)" },
      { "<leader>gc", "<cmd>Neogit commit<cr>", desc = "Git Commit (Neogit)" },
      { "<leader>gl", "<cmd>Neogit log<cr>",    desc = "Git Log (Neogit)" },
      { "<leader>gs", "<cmd>Neogit stash<cr>",  desc = "Git Stash (Neogit)" },
      { "<leader>gr", "<cmd>Neogit rebase<cr>", desc = "Git Rebase (Neogit)" },

      { "<leader>gt", "<cmd>Neogit fetch<cr>",  desc = "Git Fetch (Neogit)" },
      { "<leader>gp", "<cmd>Neogit pull<cr>",   desc = "Git Pull (Neogit)" },
      { "<leader>gP", "<cmd>Neogit push<cr>",   desc = "Git Push (Neogit)" },
    },
  },
}
