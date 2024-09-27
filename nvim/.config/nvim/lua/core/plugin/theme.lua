-- Themes in theme/ directory
local themes = {
  nord = {
    require("core.plugin.theme.nord"),
  },
}

return themes[vim.g.config.theme.name]

