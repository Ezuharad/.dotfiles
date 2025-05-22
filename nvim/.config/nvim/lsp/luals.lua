return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  -- root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" }, -- seems to break for some reason
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "wezterm" },
      },
      telemetry = {
        enable = false,
      },
      spell = {
        enabled = false
      },
      runtime = {
        version = "LuaJIT"
      }
    }
  }
}
