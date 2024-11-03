-- statusline
return {
  "nvim-lualine/lualine.nvim",
  config = true,
  opts = {
    options = {
      theme = function()
        local theme = require("lualine.themes." .. vim.g.config.theme.name)
        theme.normal.c.bg = "None"
        theme.inactive.c.bg = "None"
        return theme
      end,
    },
    extensions = { "man", "mason", "oil" },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "tabs" },
      lualine_z = { "progress", "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
  },
}
