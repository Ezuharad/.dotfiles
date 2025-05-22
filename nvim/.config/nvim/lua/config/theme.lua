-- setup nvim theme
vim.g.config = {
  theme = {
    name = "nord",
    alpha = {
      header = "nerv_logo",
    },
    border = {
      float_border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
    },
    highlights = {
      RainbowDelimiterRed = { fg = "#BF616A", ctermfg = "Red", bg = "none" },
      RainbowDelimiterOrange = { fg = "#D08770", ctermfg = "Brown" },
      RainbowDelimiterYellow = { fg = "#EBCB8B", ctermfg = "Yellow" },
      RainbowDelimiterGreen = { fg = "#A3BE8C", ctermfg = "Yellow" },
      RainbowDelimiterBlue = { fg = "#88C0D0", ctermfg = "Blue" },
      RainbowDelimiterCyan = { fg = "#5E81AC", ctermfg = "Cyan" },
      RainbowDelimiterViolet = { fg = "#B48EAD", ctermfg = "Magenta" },

      FlashMatch = { bg = "#D08770", fg = "#000000", ctermfg = "Blue",  },
      FlashLabel = { bg = "#E0FF08", fg = "#000000", ctermfg = "Black"  },
    }
  },
}
