-- completions
return {
  {
    "Saghen/blink.cmp",
    lazy = false,
    enabled = true,
    dependencies = { "rafamadriz/friendly-snippets", "xzbdmw/colorful-menu.nvim" },
    version = "v0.5.1",
    opts = {
      nerd_font_variant = "mono",
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      completion = {
        documentation = {
          window = {
            border = "rounded",
            winblend = "pumblend",
          },
        },
        menu = {
          border = "rounded",
          winblend = "pumblend",
          draw = {
            columns = {
              { "kind_icon" },
              { "label", gap = 1 },
            },
            treesitter = {
              "lsp",
            },
            components = {
              label = {
                text = function(ctx)
                  return require("colorful-menu").blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require("colorful-menu").blink_components_highlight(ctx)
                end,
              },
            },
          },
        },
      },
      fuzzy = {
        implementation = "prefer_rust_with_warning",
        sorts = {
          function(a, b)
            local source_priority = {
              lsp = 4,
              path = 3,
              snippets = 2,
              buffer = 1,
            }
            local a_priority = source_priority[a.source_id]
            local b_priority = source_priority[b.source_id]
            if a_priority ~= b_priority then
              return a_priority > b_priority
            end
          end,
          "score",
          "sort_text",
        },
      },
      keymap = {
        preset = nil,
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<Tab>"] = { "select_and_accept", "fallback" },
        ["<C-k>"] = { "show_documentation", "hide_documentation", "fallback" },
        ["<C-l>"] = { "hide", "fallback" },
        ["<M-u>"] = { "scroll_documentation_up" },
        ["<M-d>"] = { "scroll_documentation_down" },
      },
    },
  },
}
