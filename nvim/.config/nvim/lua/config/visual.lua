-- non-theme visuals loaded after theme
-- set colorscheme
vim.cmd("colorscheme " .. vim.g.config.theme.name)

-- set transparent backgrounds
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { bg = "none" })
vim.opt.pumblend = 0
-- vim.cmd("autocmd FileType mason setlocal winblend=0")

vim.opt.laststatus = 3

