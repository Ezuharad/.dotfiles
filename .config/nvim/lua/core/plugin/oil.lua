-- Buffer-like file explorer
return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {
    default_file_explorer = true,
    columns = {
      "icon"
    },
    view_options = {
      show_hidden = true
    },
    is_hidden_file = function(name, _)
      return vim.startswith(name, ".")
    end,
    is_always_hidden = {".git"}
  },
  keys = {
    { "<leader>vo", "<cmd>Oil --float<cr>", desc = "Oil Filesearch (Oil)" }
  }
}
