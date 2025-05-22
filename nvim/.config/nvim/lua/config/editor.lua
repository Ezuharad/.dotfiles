-- general editor configurations
-- use UTF 8
vim.opt.encoding = "UTF-8"

-- language settings
vim.opt.spelllang = "en_us"
vim.opt.spell = false

-- terminal settings
vim.g.terminal_emulator = "wezterm"
vim.opt.shell = "zsh"
vim.opt.termguicolors = true
vim.opt.ttyfast = true

-- set tab spacing
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- see whitespace
vim.opt.listchars = {
  tab = "▶ ",
  trail = "·",
  nbsp = "·",
}
vim.opt.list = true

-- backspacing over autoindents
vim.opt.backspace = { "indent", "eol", "start" }

-- allow hiding unsaved buffers
vim.opt.hidden = true

-- automatically read file changes
vim.opt.autoread = true

-- allow going beyond characters in V-BLOCK mode
vim.opt.virtualedit = { "block" }

-- use treesitter for folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

-- set default register to OS clipboard
vim.o.clipboard = "unnamedplus"

-- feedback for regex search
vim.opt.incsearch = true

-- increment octal
vim.opt.nrformats = { "bin", "octal", "hex" }

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- disable matchit
vim.g.loaded_matchit = 1

-- disable mouse
vim.opt.mouse = ""

-- undo and swap files
vim.opt.ul = 32
local homedir = os.getenv("HOME")

if homedir ~= nil and homedir ~= "" then
  vim.opt.undofile = true
  vim.opt.undodir = homedir .. "/.cache/nvim/undo"
  vim.dir = homedir .. ".cache/nvim/swap"
  vim.backupdir = homedir .. ".cache/nvim/backup"
end
