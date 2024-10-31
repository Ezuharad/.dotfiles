-- LSP configuration
return {
  {
    "williamboman/mason.nvim",
    config = true,
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "hrsh7th/nvim-cmp" },
    config = function()
      require("mason-lspconfig").setup({ ensure_installed = { "lua_ls" } })
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            handlers = require("core.plugin.lsp.handler"),
            settings = require("core.plugin.lsp.settings"),
          })
        end,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    keys = {
      { "<leader>ra", vim.lsp.buf.code_action, desc = "Code Actions" },
      { "<leader>rf", vim.lsp.buf.format, desc = "Format Code"},
      { "<leader>rn", vim.lsp.buf.rename, desc = "Rename Symbol"},
      { "<leader>rs", vim.lsp.buf.signature_help, desc = "Signature Help" },
      { "<leader>ri", vim.lsp.buf.implementation, desc = "Go to Implementation" },
      { "gd", vim.lsp.buf.definition, desc = "Go to Definition" },
      { "gD", vim.lsp.buf.declaration, desc = "Go to Declaration" },
      { "<leader>rr", vim.lsp.buf.references, desc = "Go to References" },
    },
  },
}
