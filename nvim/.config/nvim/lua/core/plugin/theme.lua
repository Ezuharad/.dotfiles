-- Themes in theme/ directory
local themes = {
  nord = {
    require("core.plugin.theme.nord"),
  },
}

local selectedTheme = themes[vim.g.config.theme.name]

return selectedTheme
