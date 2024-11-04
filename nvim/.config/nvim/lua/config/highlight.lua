-- non-theme visuals loaded after theme
-- set colorscheme
vim.cmd("colorscheme " .. vim.g.config.theme.name)

-- other options
vim.opt.pumblend = 0
vim.opt.laststatus = 3

local transparent_highlights = {
  "Normal",
  "NormalFloat",
  "FloatBorder",
  "DiagnosticVirtualTextError",
  "DiagnosticVirtualTextWarn",
  "DiagnosticVirtualTextInfo",
  "DiagnosticVirtualTextHint",
  "SignColumn"
}
for _, hl in pairs(transparent_highlights) do
  vim.api.nvim_set_hl(0, hl, { bg = "none" })
end

for hl, opts in pairs(vim.g.config.theme.highlights) do
  vim.api.nvim_set_hl(0, hl, opts)
end

