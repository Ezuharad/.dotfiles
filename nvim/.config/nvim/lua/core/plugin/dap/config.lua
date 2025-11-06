-- Language specific adapter configurations
return {
  python = {
    {
      type = "python",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      pythonPath = function()
        return "python"
      end,
    },
  },
  cpp = {
    name = "lldb",
    type = "cpp",
    request = "launch",
    program = function()
      vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    externalTerminal = false,
    stopOnEntry = false,
    args = {}
  },
}
