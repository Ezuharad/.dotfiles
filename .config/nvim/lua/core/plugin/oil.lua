-- Buffer-like file explorer
return {
	"stevearc/oil.nvim",
	lazy = false,
	opts = {
		default_file_explorer = true,
		columns = {
				"icon"
			}
		},
	keys = {
		{"<leader>vo", "<cmd>Oil --float<cr>", desc="Oil Filesearch (Oil)"}
	}
}
