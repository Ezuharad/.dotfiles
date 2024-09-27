-- nicer UIs
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
    presets = {
      command_palette = true,
      lsp_doc_border = true
    },
    notify = {
      enabled = false
    },
    message = { -- disable LSP server messages
      enabled = false
    }
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
    "hrsh7th/nvim-cmp"
	},
}
