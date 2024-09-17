-- General editor configurations
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

-- feedback for regex search
vim.opt.incsearch = true

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- terminal settings
vim.g.terminal_emulator = 'wezterm'
vim.opt.shell = 'zsh'
vim.opt.termguicolors = true

-- misc. options
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.mouse = ''
vim.opt.hidden = true

