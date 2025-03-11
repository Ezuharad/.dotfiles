local wezterm = require("wezterm")
local mux = wezterm.mux

local config = wezterm.config_builder()

-- keybindings
config.leader = { key = " ", mods = "CTRL" }
config.keys = require("config.key")
config.disable_default_mouse_bindings = true

-- window settings
wezterm.on("gui-startup", function()
  local _, _, window = mux.spawn_window({})  -- tab, pane, window = ...
  window:gui_window():maximize()
end)

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.term = "xterm-256color"

-- scrolling
config.scrollback_lines = 3500

-- colorscheme
config.use_fancy_tab_bar = false
config.color_scheme = "nord"
config.colors = {
  tab_bar = {
    background = "rgba(0,0,0,0)"
  }
}
require("config.tabbarstyle")
config.hide_tab_bar_if_only_one_tab = true

-- disable missing glyph warning
config.warn_about_missing_glyphs = false

return config
