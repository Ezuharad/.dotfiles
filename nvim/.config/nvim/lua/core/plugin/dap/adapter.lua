-- debug adapter protocol adapters
return {
  python = {
    type = "executable",
    command = "python",
    args = { "-m", "debugpy.adapter" },
  },
  cpp = {
    type = "executable",
    attach = {
      pidProperty = "pid",
      pidSelect = "ask"
    },
    command = "lldb",
    env = {
      LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
    },
    name = "lldb"
  }
}
