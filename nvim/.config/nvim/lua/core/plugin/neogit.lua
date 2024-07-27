-- Git integration
return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",

    "nvim-telescope/telescope.nvim",
  },
  config = true,
  opts = {
    graph_style = "unicode",
    kind = "floating"
  }
}
