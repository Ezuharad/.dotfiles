return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    opts = {
      swap = {
        enable = true,
      },
    },
    keys = {
      {
        "<C-Left>",
        function()
          require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner")
        end,
        desc = "Swap with previous argument",
      },
      {
        "<C-Right>",
        function()
          require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
        end,
        desc = "Swap with next argument",
      },
    },
  },
}
