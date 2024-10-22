-- general editor configurations
-- set tab spacing
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- set clipboard to OS clipboard
vim.o.clipboard = "unnamedplus"

-- language settings
vim.opt.spelllang = 'en_us'
vim.opt.spell = false

-- use UTF 8
vim.opt.encoding = "UTF-8"

-- see whitespace
vim.opt.listchars = {
  tab = "▶ ",
  trail = "·",
  nbsp = "·"
}
vim.opt.list = true

-- feedback for regex search
vim.opt.incsearch = true

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- terminal settings
vim.g.terminal_emulator = 'wezterm'
vim.opt.shell = 'zsh'
vim.opt.termguicolors = true

-- line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- disable mouse
vim.opt.mouse = ''

-- allow hiding unsaved buffers
vim.opt.hidden = true
