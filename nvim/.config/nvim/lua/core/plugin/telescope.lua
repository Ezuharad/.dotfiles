-- Searching plugin for files, buffers, tags, and git objects
return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = true,
		keys = {
			{ "<leader>ff", "<cmd> Telescope find_files<cr>", desc = "Telescope Files (Telescope)" },
			{
				"<leader>fF",
				function()
					require("telescope.builtin").find_files({ hidden = true })
				end,
				desc = "Telescope Hidden Files (Telescope)",
			},
			{ "<leader>ft", "<cmd> Telescope live_grep<cr>", desc = "Telescope Text (Telescope)" },
			{ "<leader>fb", "<cmd> Telescope buffers<cr>", desc = "Telescope Buffers (Telescope)" },
			{ "<leader>fh", "<cmd> Telescope help_tags<cr>", desc = "Telescope Help Tags (Telescope)" },
			{ "<leader>fr", "<cmd> Telescope marks<cr>", desc = "Telescope Vim Marks (Telescope)" },
			{ "<leader>fp", "<cmd> Telescope man_pages<cr>", desc = "Telescope Man Pages (Telescope)" },

      { "<leader>fe", "<cmd> Telescope treesitter<cr>", desc = "Telescope Treesitter (Telescope)"},

			{ "<leader>gfb", "<cmd> Telescope git_branches<cr>", desc = "Telescope Git Branches (Telescope)" },
			{ "<leader>gfc", "<cmd> Telescope git_commits<cr>", desc = "Telescope Git Commits (Telescope)" },
		},
	},
}
