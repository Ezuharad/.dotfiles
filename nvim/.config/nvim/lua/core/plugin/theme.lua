-- themes in theme/ directory
local themes = {
  nord = {
    { "arcticicestudio/nord-vim" },
  },
}

return themes[vim.g.config.theme.name]
