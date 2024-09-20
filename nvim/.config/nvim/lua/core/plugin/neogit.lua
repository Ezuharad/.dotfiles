-- Git integration
return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",

		"nvim-telescope/telescope.nvim",
	},
	config = true,
	opts = {
		graph_style = "unicode",
		kind = "floating",
	},
	keys = {
		{ "<leader>gb", "<cmd>Neogit branch<CR>", desc = "Git Branch (Neogit)" },
		{ "<leader>gd", "<cmd>Neogit diff<CR>", desc = "Git Diff (Neogit)" },
		{ "<leader>gc", "<cmd>Neogit commit<CR>", desc = "Git Commit (Neogit)" },
		{ "<leader>gl", "<cmd>Neogit log<CR>", desc = "Git Log (Neogit)" },
		{ "<leader>gs", "<cmd>Neogit stash<CR>", desc = "Git Stash (Neogit)" },
		{ "<leader>gr", "<cmd>Neogit rebase<CR>", desc = "Git Rebase (Neogit)" },

		{ "<leader>gt", "<cmd>Neogit fetch<CR>", desc = "Git Fetch (Neogit)" },
		{ "<leader>gp", "<cmd>Neogit pull<CR>", desc = "Git Pull (Neogit)" },
		{ "<leader>gP", "<cmd>Neogit push<CR>", desc = "Git Push (Neogit)" },
	},
}
