-- Language specific settings for LSP
return {
  Lua = {
    diagnostics = {
      globals = { "vim" }
    },
    telemetry = {
      enable = false
    }
  }
}
