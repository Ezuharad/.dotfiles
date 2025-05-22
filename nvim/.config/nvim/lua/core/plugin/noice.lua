-- nicer UIs
return {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    -- "hrsh7th/nvim-cmp",
  },
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      progress = {
        enabled = false,
      },
    },
    presets = {
      command_palette = true,
      lsp_doc_border = true,
    },
    message = { -- disable LSP server messages
      enabled = false,
    },
    notify = {
      enabled = false,
    },
    views = {
      mini = {
        win_options = {
          winblend = 0,
        },
        border = {
          style = vim.g.config.theme.border.float_border,
          size = {
            width = 60,
            height = "auto"
          }
        }
      },
    },
  },
  event = "VeryLazy",
}
