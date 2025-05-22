-- completions
return {
  {
    "Saghen/blink.cmp",
    dependencies = { "xzbdmw/colorful-menu.nvim" },
    version = "v1.*",
    opts = {
      sources = {
        default = {
          -- "buffer",  -- just adds random text
          "cmdline",
          "lsp",
          "omni",
          "path",
          "snippets"
        },
        per_filetype = {
          markdown = {},
        },
        transform_items = function(_, items) -- remove text items from LSP
          local blacklist =
            {
              vim.lsp.protocol.CompletionItemKind.Text,
              -- vim.lsp.protocol.CompletionItemKind.Snippet
            }
          return vim.tbl_filter(function(item)
            for _, v in ipairs(blacklist) do
              if item.kind == v then
                return false
              end
            end
            return true
          end, items)
        end,
      },
      completion = {
        documentation = {
          window = {
            border = vim.g.config.theme.border.float_border,
            winblend = 0,
          },
        },
        menu = {
          border = vim.g.config.theme.border.float_border,
          winblend = 0,
          draw = {
            columns = {
              { "kind_icon", "label", gap = 1 },
              { "kind" },
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
      signature = {
        window = {
          border = vim.g.config.theme.border.float_border,
        },
      },
      fuzzy = {
        implementation = "prefer_rust_with_warning",
        sorts = {
          function(a, b)
            local source_priority = {
              cmdline = 6,
              omni = 5,
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
