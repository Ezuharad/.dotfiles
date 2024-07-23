-- Tree-visualization for nonlinear undo operations
return {
	"mbbill/undotree",
	lazy = true,
	cmd = "UndotreeToggle",
	keys = {
		{ "<leader>vu", "<cmd>UndotreeToggle<cr>", desc = "Undo Tree (Undotree)" },
	},
	config = true,
}
