-- Debug Adapter Protocol support
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = { "nvim-neotest/nvim-nio", "rcarriga/nvim-dap-ui" },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = dapui.open
      dap.listeners.before.launch.dapui_config = dapui.open
      dap.listeners.before.event_terminated.dapui_config = dapui.close
      dap.listeners.before.event_exited.dapui_config = dapui.close

      dap.adapters = require("core.plugin.dap.adapter")
      dap.configurations = require("core.plugin.dap.config")

      dapui.setup()
    end,
    keys = {
      {
        "<leader>ds",
        function()
          require("dapui").toggle()
        end,
        desc = "Toggle Debugger",
      },
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Debugger Breakpoint",
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue Debugger",
      },
      {
        "<leader>dl",
        function()
          require("dap").step_over()
        end,
        desc = "Debugger Step Over",
      },
      {
        "<leader>dj",
        function()
          require("dap").step_into()
        end,
        desc = "Debugger Step Into",
      },
      {
        "<leader>dk",
        function()
          require("dap").step_out()
        end,
        desc = "Debugger Step Out",
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.open()
        end,
        desc = "Show REPL",
      },
      {
        "<leader>do",
        function()
          require("dap.ui.variables").scopes()
        end,
        desc = "Show Debugger Scopes",
      },
    },
  },
}
