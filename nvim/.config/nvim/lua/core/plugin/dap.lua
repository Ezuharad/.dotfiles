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
        desc = "Toggle Debugger (Dap-ui)",
      },
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Debugger Breakpoint (Dap-ui)",
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue Debugger (Dap-ui)",
      },
      {
        "<leader>dl",
        function()
          require("dap").step_over()
        end,
        desc = "Debugger Step Over (Dap-ui)",
      },
      {
        "<leader>dj",
        function()
          require("dap").step_into()
        end,
        desc = "Debugger Step Into (Dap-ui)",
      },
      {
        "<leader>dk",
        function()
          require("dap").step_out()
        end,
        desc = "Debugger Step Out (Dap-ui)",
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.open()
        end,
        desc = "Show REPL (Dap-ui)",
      },
      {
        "<leader>do",
        function()
          require("dap.ui.variables").scopes()
        end,
        desc = "Show Debugger Scopes (Dap-ui)",
      },
    },
  },
}
