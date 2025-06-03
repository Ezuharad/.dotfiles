-- common lsp configuration
local blink_capabilities = require("blink.cmp").get_lsp_capabilities()
local base_capabilities = {
  offsetEncoding = { "utf-8", "utf-16" },
  textDocument = {
    completion = {
      edits_near_completion = true
    },
    semanticTokens = {
      multilineTokenSupport = true
    }
  }
}

local capabilities = vim.tbl_deep_extend("keep", base_capabilities, blink_capabilities)

vim.lsp.config("*", {
  root_markers = {
    ".git", ".hg"
  },
  capabilities = capabilities,
  single_file_support = true
})

vim.lsp.enable({
  "bacon-ls",
  "bash-ls",
  "clangd",
  "css-ls",
  "luals",
  "html-ls",
  "marksman",
  "pyright",
  "ruff",
  "rust-analyzer",
  "tinymist",
  "yaml-ls"
})
