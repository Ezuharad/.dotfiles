-- Mason configuration
local null_ls_config = function()
  local null_ls = require("null-ls")
  return {
    sources = {
      -- null_ls.builtins.completion.luasnip,
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.completion.spell,
    },
  }
end

return {
  {
    "williamboman/mason.nvim",
    config = true,
    opts = {
      ui = {
        border = vim.g.config.theme.border.float_border,
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    -- config = true
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "L3MON4D3/LuaSnip" },
    lazy = true,
    enabled = true,
    keys = {
      { "grf", vim.lsp.buf.format, desc = "Buffer Reformat (None-ls)" },
    },
    opts = null_ls_config,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    enabled = true,
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    opts = null_ls_config
  },
}
