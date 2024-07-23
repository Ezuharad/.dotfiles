-- Treesitter support
return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	ots = {
		ensure_installed = {
			"lua",
		},
	},
}
