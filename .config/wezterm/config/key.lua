-- Keyboard shortcuts
return function(config)
  local wezterm = require("wezterm")
  config.keys = {
    {
      key = "F12",
      action = wezterm.action.ToggleFullScreen
    }
  }
  return config
end

