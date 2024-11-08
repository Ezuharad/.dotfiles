-- linter and formatter support for LSP
local config = function()
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
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "L3MON4D3/LuaSnip" },
    lazy = true,
    keys = {
      { "<leader>rf", vim.lsp.buf.format, desc = "Buffer Reformat (None-ls)" },
    },
    opts = config,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    opts = config
  },
}
