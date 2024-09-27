-- non-theme visuals loaded after theme
-- set colorscheme
vim.cmd("colorscheme " .. vim.g.config.theme.name)

-- set transparent backgrounds
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.opt.pumblend = 0

