-- Python venv selection support
return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    "mfussenegger/nvim-dap-python",
    { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
  },
  lazy = true,
  branch = "regexp",
  config = true,
  keys = {
    { "<leader>fv", "<cmd>VenvSelect<cr>", desc = "Telescope Venvs (Venv-Selector)" },
  },
  opts = {
    settings = {
      search = {
        anaconda_base = {
          command = "fd /python$ ~/.miniconda3/ --full-path --color never -E /proc",
          type = "anaconda",
        },
        anaconda_project = {
          command = "fd /python$ ~/Code --full-path --color never -E /proc",
          type = "anaconda",
        },
      },
    },
  },
}
