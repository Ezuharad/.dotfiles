-- Language specific settings for LSP
return {
  Lua = {
    diagnostics = {
      globals = { "vim", "wezterm" },
    },
    telemetry = {
      enable = false,
    },
  },
}
