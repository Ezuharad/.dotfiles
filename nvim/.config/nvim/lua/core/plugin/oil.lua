-- Buffer-like file explorer
return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {
    default_file_explorer = true,
    skip_confirm_for_simple_edits = true,
    columns = {
      "icon",
    },
    view_options = {
      show_hidden = true
    },
    is_hidden_file = function(name, _)
      return vim.startswith(name, ".")
    end,
    is_always_hidden = {".git", ".conda", ".venv"}
  },
  keys = {
    { "<leader>vo", "<cmd>Oil --float<cr>", desc = "Oil Filesearch (Oil)" }
  }
}
