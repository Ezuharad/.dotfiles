local wezterm = require("wezterm")
local config = wezterm.config_builder()

config = require("config.window")(config)
config = require("config.key")(config)
config = require("config.theme")(config)
config = require("config.bell")(config)

local mux = wezterm.mux
wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window({})
  window:gui_window():maximize()
end)

return config
