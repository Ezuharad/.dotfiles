-- buffer-like file explorer
return {
  {
    "echasnovski/mini.icons",
    version = false,
    config = true,
  },
  {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true,
      columns = {
        "icon",
      },
      constrain_cursor = "name",
      watch_for_changes = true,
      view_options = {
        show_hidden = true,
      },
      is_hidden_file = function(name, _)
        return vim.startswith(name, ".")
      end,
      is_always_hidden = require("core.plugin.file.hidden")
    },
    keys = {
      { "<leader>vf", "<cmd>Oil --float<cr>", desc = "Oil Filesearch (Oil)" },
    },
  },
}
