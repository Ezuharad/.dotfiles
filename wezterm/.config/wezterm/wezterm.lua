local wezterm = require("wezterm")
local config = wezterm.config_builder()

config = require("config.window")(config)
config = require("config.key")(config)
config = require("config.theme")(config)

return config
