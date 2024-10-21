-- Highlight TODO comments
return {
  "folke/todo-comments.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = true,
  lazy = false,
  keys = {
    {
      "<leader>fo",
      function()
        require("telescope")
        vim.cmd("TodoTelescope")
      end,
      desc = "Telescope TODOs (Todo-comments)",
    },
  },
}
