-- debug adapter protocol adapters
return {
  python = {
    type = "executable",
    command = "python",
    args = { "-m", "debugpy.adapter" },
  },
}
