-- keybindings
local wezterm = require("wezterm")
local act = wezterm.action

local mods = "ALT"

-- Vi integration for movement
local function isViProcess(pane)
  -- get_foreground_process_name On Linux, macOS and Windows,
  -- the process can be queried to determine this path. Other operating systems
  -- (notably, FreeBSD and other unix systems) are not currently supported
  return pane:get_foreground_process_name():find("n?vim") ~= nil or pane:get_title():find("n?vim") ~= nil
end

local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
  if isViProcess(pane) then
    window:perform_action(act.SendKey({ key = vim_direction, mods = mods }), pane)
  else
    window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
  end
end

local function conditionalScrollText(window, pane, amount, vim_direction)
  if isViProcess(pane) then
    window:perform_action(act.SendKey({ key = vim_direction, mods = mods }), pane)
  else
    window:perform_action(act.ScrollByPage(amount), pane)
  end
end

wezterm.on("ActivatePaneDirection-right", function(window, pane)
  conditionalActivatePane(window, pane, "Right", "l")
end)
wezterm.on("ActivatePaneDirection-left", function(window, pane)
  conditionalActivatePane(window, pane, "Left", "h")
end)
wezterm.on("ActivatePaneDirection-up", function(window, pane)
  conditionalActivatePane(window, pane, "Up", "k")
end)
wezterm.on("ActivatePaneDirection-down", function(window, pane)
  conditionalActivatePane(window, pane, "Down", "j")
end)
wezterm.on("ScrollText-up", function(window, pane)
  conditionalScrollText(window, pane, -0.5, "u")
end)
wezterm.on("ScrollText-down", function(window, pane)
  conditionalScrollText(window, pane, 0.5, "d")
end)

local keybinds = {
  -- tab creation and deletion
  { key = "t", mods = mods,             action = act.SpawnTab("CurrentPaneDomain") },
  { key = "t", mods = mods .. "|SHIFT", action = act.CloseCurrentTab({ confirm = true }) },
  -- pane splitting
  {
    key = "-",
    mods = mods,
    action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "\\",
    mods = mods,
    action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  -- pane navigation
  { key = "h",   mods = mods,                  action = act.EmitEvent("ActivatePaneDirection-left") },
  { key = "j",   mods = mods,                  action = act.EmitEvent("ActivatePaneDirection-down") },
  { key = "k",   mods = mods,                  action = act.EmitEvent("ActivatePaneDirection-up") },
  { key = "l",   mods = mods,                  action = act.EmitEvent("ActivatePaneDirection-right") },
  -- pane scrolling
  { key = "u",   mods = "ALT",                 action = act.EmitEvent("ScrollText-up") },
  { key = "d",   mods = "ALT",                 action = act.EmitEvent("ScrollText-down") },
  -- pane resizing
  { key = "h",   mods = mods .. "|SHIFT",      action = act.AdjustPaneSize({ "Left", 15 }) },
  { key = "j",   mods = mods .. "|SHIFT",      action = act.AdjustPaneSize({ "Down", 15 }) },
  { key = "k",   mods = mods .. "|SHIFT",      action = act.AdjustPaneSize({ "Up", 15 }) },
  { key = "l",   mods = mods .. "|SHIFT",      action = act.AdjustPaneSize({ "Right", 15 }) },
  -- pane rotation
  { key = "r",   mods = mods,                  action = act.RotatePanes("Clockwise") },
  { key = "r",   mods = mods .. "|SHIFT",      action = act.RotatePanes("CounterClockwise") },
  -- pane zoom / unzoom
  { key = "g",   mods = mods,                  action = act.TogglePaneZoomState },
  -- pane visual select
  { key = "v",   mods = mods,                  action = act.ActivateCopyMode },
  -- resize full window
  { key = "F12", action = act.ToggleFullScreen },
}

-- cycle through tabs
for i = 1, 8 do
  table.insert(keybinds, { key = tostring(i), mods = mods, action = act.ActivateTab(i - 1) })
end

return keybinds
