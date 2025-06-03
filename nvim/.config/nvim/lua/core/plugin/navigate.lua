-- key navigation changes
return {
  {
    "nullromo/go-up.nvim",
    opts = {},
    config = true
  },
  {  -- muxer integration
    "numToStr/Navigator.nvim",
    lazy = true,
    config = true,
    keys = {
      { "<M-h>", "<cmd>NavigatorLeft<cr>",  desc = "Move Left (Navigator)" },
      { "<M-j>", "<cmd>NavigatorDown<cr>",  desc = "Move Down (Navigator)" },
      { "<M-k>", "<cmd>NavigatorUp<cr>",    desc = "Move Up (Navigator)" },
      { "<M-l>", "<cmd>NavigatorRight<cr>", desc = "Move Right (Navigator)" },
    },
  },
}
