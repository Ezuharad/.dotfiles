-- Themes in theme/ directory
local themes = {
  nord = {
    require("core.plugin.theme.nord"),
  },
}

-- Set transparent backgrounds
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.opt.pumblend = 0

local selectedTheme = themes[vim.g.config.theme.name]

return selectedTheme
