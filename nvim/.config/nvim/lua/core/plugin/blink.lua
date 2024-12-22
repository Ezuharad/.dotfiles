-- completions
return {
  {
    "Saghen/blink.cmp",
    lazy = false,
    enabled = false,
    dependencies = "rafamadriz/friendly-snippets",
    version = "v0.5.1",
    opts = {
      nerd_font_variant = "mono",
      sources = {
        completion = {
          enabled_providers = { "lsp", "path", "snippets", "buffer" }
        }
      }
    }
  }
}
