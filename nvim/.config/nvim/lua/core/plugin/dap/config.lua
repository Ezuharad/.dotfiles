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
  }
}
