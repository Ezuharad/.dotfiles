-- Searching plugin for files, buffers, tags, and git objects
return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"echasnovski/mini.icons", -- replaced "nvim-tree/nvim-web-devicons"
			"nvim-treesitter/nvim-treesitter",
		},
		lazy = true,
		keys = {
			-- Files and buffers
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope Files (Telescope)" },
			{
				"<leader>fF",
				function()
					require("telescope.builtin").find_files({ hidden = true })
				end,
				desc = "Telescope Hidden Files (Telescope)",
			},
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope Buffers (Telescope)" },

			-- Documentation
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Telescope Help Tags (Telescope)" },
			{ "<leader>fm", "<cmd>Telescope man_pages<cr>", desc = "Telescope Man Pages (Telescope)" },

			-- LSP
			{
				"<leader>fd",
				"<cmd>Telescope lsp_definitions<cr>",
				desc = "Telescope Hovered Definitions (Telescope)",
			},
			{
				"<leader>fi",
				"<cmd>Telescope lsp_implementations<cr>",
				desc = "Telescope Hovered Implementations (Telescope)",
			},
			{
				"<leader>fr",
				"<cmd>Telescope lsp_references<cr>",
				desc = "Telescope Hovered References (Telescope)",
			},

			-- Strings
			{ "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Telescope Hovered Text (Telescope)" },
			{ "<leader>ft", "<cmd>Telescope live_grep<cr>", desc = "Telescope Text (Telescope)" },
			{ "<leader>fg", "<cmd>Telescope glyph<cr>", desc = "Telescope Gylphs (Telescope-Glyph)" },

			-- Fixing stuff
			{ "<leader>fx", "<cmd>Telescope diagnostics<cr>", desc = "Telescope Diagnostics (Telescope)" },
			{ "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = "Telescope Quick Fixes (Telescope)" },
			{ "<leader>ft", "<cmd>Telescope treesitter<cr>", desc = "Telescope Treesitter (Telescope)" }, -- TODO: does not seem to work

			-- Git stuff
			{ "<leader>gfb", "<cmd>Telescope git_branches<cr>", desc = "Telescope Git Branches (Telescope)" },
			{ "<leader>gfc", "<cmd>Telescope git_commits<cr>", desc = "Telescope Git Commits (Telescope)" },
			{
				"<leader>gff",
				"<cmd>Telescope git_files<cr>",
				desc = "Telescope Git-Tracked Files (Telescope)",
			},
		},
		opts = {
			defaults = {
				file_ignore_patterns = require("core.plugin.file.hidden"),
			},
		},
		cmd = {
			"Telescope",
		},
	},
}
