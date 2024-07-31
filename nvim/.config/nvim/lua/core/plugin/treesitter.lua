-- Treesitter support
return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	ots = {
		ensure_installed = {
      "bash",
			"lua",
      "markdown",
      "regex",
      "vim",
		},
	},
}
