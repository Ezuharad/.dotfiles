-- disable treesitter highlight
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = { enable = false },
    },
  },
}
