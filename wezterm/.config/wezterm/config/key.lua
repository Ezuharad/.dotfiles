-- keybindings
local wezterm = require("wezterm")
local act = wezterm.action

local MODS = "ALT"
local ADJUST_PANE_AMOUNT = 15
local SCROLL_AMOUNT = 0.5

local function hasProcessNamed(pane, regexes)
  if type(regexes) == "string" then
    return pane:get_foreground_process_name():find(regexes) ~= nil or pane:get_title():find(regexes) ~= nil
  end

  for _, regex in pairs(regexes) do
    if pane:get_foreground_process_name():find(regex) ~= nil or pane:get_title():find(regex) ~= nil then
      return true
    end
  end

  return false
end

local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
  if hasProcessNamed(pane, "n?vim") then
    window:perform_action(act.SendKey({ key = vim_direction, mods = MODS }), pane)
  else
    window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
  end
end

local function conditionalScrollText(window, pane, amount, vim_direction)
  if hasProcessNamed(pane, {"git", "less", "man", "more", "n?vim", "ssh"}) then
    window:perform_action(act.SendKey({ key = vim_direction, mods = MODS }), pane)
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
  conditionalScrollText(window, pane, -SCROLL_AMOUNT, "u")
end)
wezterm.on("ScrollText-down", function(window, pane)
  conditionalScrollText(window, pane, SCROLL_AMOUNT, "d")
end)

local keybinds = {
  -- tab creation and deletion
  { key = "t", mods = MODS,             action = act.SpawnTab("CurrentPaneDomain") },
  { key = "t", mods = MODS .. "|SHIFT", action = act.CloseCurrentTab({ confirm = true }) },
  -- pane splitting
  {
    key = "-",
    mods = MODS,
    action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "\\",
    mods = MODS,
    action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  -- pane navigation
  { key = "h",   mods = MODS,                  action = act.EmitEvent("ActivatePaneDirection-left") },
  { key = "j",   mods = MODS,                  action = act.EmitEvent("ActivatePaneDirection-down") },
  { key = "k",   mods = MODS,                  action = act.EmitEvent("ActivatePaneDirection-up") },
  { key = "l",   mods = MODS,                  action = act.EmitEvent("ActivatePaneDirection-right") },
  -- pane scrolling
  { key = "u",   mods = "ALT",                 action = act.EmitEvent("ScrollText-up") },
  { key = "d",   mods = "ALT",                 action = act.EmitEvent("ScrollText-down") },
  -- pane resizing
  { key = "h",   mods = MODS .. "|SHIFT",      action = act.AdjustPaneSize({ "Left", ADJUST_PANE_AMOUNT }) },
  { key = "j",   mods = MODS .. "|SHIFT",      action = act.AdjustPaneSize({ "Down", ADJUST_PANE_AMOUNT }) },
  { key = "k",   mods = MODS .. "|SHIFT",      action = act.AdjustPaneSize({ "Up", ADJUST_PANE_AMOUNT }) },
  { key = "l",   mods = MODS .. "|SHIFT",      action = act.AdjustPaneSize({ "Right", ADJUST_PANE_AMOUNT }) },
  -- pane rotation
  { key = "r",   mods = MODS,                  action = act.RotatePanes("Clockwise") },
  { key = "r",   mods = MODS .. "|SHIFT",      action = act.RotatePanes("CounterClockwise") },
  -- pane zoom / unzoom
  { key = "m",   mods = MODS,                  action = act.TogglePaneZoomState },
  -- pane visual select
  { key = "v",   mods = MODS,                  action = act.ActivateCopyMode },
  -- resize full window
  { key = "F12", action = act.ToggleFullScreen },
}

-- cycle through tabs
for i = 1, 8 do
  table.insert(keybinds, { key = tostring(i), mods = MODS, action = act.ActivateTab(i - 1) })
end

return keybinds
