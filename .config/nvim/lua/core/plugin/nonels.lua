-- Linter and formatter support for LSP
return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = true,
	keys = {
		{ "<leader>rf", vim.lsp.buf.format, desc = "Buffer Reformat (None-ls)" }
	},
	opts = function()
		local null_ls = require("null-ls")
		return {
			sources = {
				null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.formatting.ruff,
				null_ls.builtins.completion.spell
			}
		}
	end
}
