-- non-theme visuals loaded after theme
vim.cmd("colorscheme " .. vim.g.config.theme.name)

vim.opt.pumblend = 0
vim.opt.laststatus = 3

local transparent_highlights = {
  "Normal",
  "NormalFloat",
  "NormalNC",
  "FloatBorder",
  "Comment",
  "DiagnosticVirtualTextError",
  "DiagnosticVirtualTextWarn",
  "DiagnosticVirtualTextInfo",
  "DiagnosticVirtualTextHint",
  "SignColumn",

  -- from https://github.com/nvim-lualine/lualine.nvim/issues/1411. Did not seem to do anything
  "StatusLine",
  "StatusLineNC",
  "Tabline",
  "TabLineFill",
  "TabLineSel",
  "Winbar",
  "WinbarNC",

  -- https://cmp.saghen.dev/configuration/appearance.html
  "BlinkCmpMenuBorder",
  "BlinkCmpMenu",
  "BlinkCmpLabel",
  "BlinkCmpLabelDetail",
  "BlinkCmpKind",

  -- https://github.com/yetone/avante.nvim/blob/main/lua/avante/highlights.lua
  "AvanteTitle",
  "AvanteReversedTitle",
  "AvanteSubtitle",
  "AvanteReversedSubtitle",
  "AvanteThirdTitle",
  "AvanteReversedThirdTitle",
  "AvantePipupHint",
  "AvantePromptInput",
  "AvantePromptInputBorder",
  "AvanteReversedNormal",
  "AvanteStateSpinnerGenerating",
  "AvanteStateSpinnterToolCalling",
  "AvanteStateSpinnerFailed",
  "AvanteStateSpinnerSucceeded",
  "AvanteStateSpinnerSearching",
  "AvanteStateSpinnerThinking",
  "AvanteStateSpinnerCompacting",
}

for _, hl in pairs(transparent_highlights) do
  vim.api.nvim_set_hl(0, hl, { bg = "none" })
end

for hl, opts in pairs(vim.g.config.theme.highlights) do
  vim.api.nvim_set_hl(0, hl, opts)
end

