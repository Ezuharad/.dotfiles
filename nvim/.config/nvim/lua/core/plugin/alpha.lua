-- Splash screen for nvim
return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
	cmd = "Alpha",
	opts = function()
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = require("core.plugin.alpha.header")[vim.g.config.theme.alpha.header]
		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New file", "ene <bar> startinsert"),
			dashboard.button("f", "?  > Find file", function()
				require("telescope")
				vim.cmd("Telescope find_files")
			end),
			dashboard.button("r", "  > Recent", function()
				require("telescope")
				vim.cmd("Telescope oldfiles")
			end),
			dashboard.button("s", "  > Settings", "<cmd>e $MYVIMRC <cr>| <cmd>cd %:p:h<cr>"),
			dashboard.button("q", "⏹  > Quit NVIM", "<cmd>qa<cr>"),
		}
		return dashboard.config
	end,
  keys = {
    { "<leader>va", "<cmd> Alpha<cr>", desc = "Show splash screen (Alpha)"}
  }
}
