-- Custom editor keybinds
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set
local default_opts = { noremap = true, silent = true }

-- recenter after n and N
map('n', 'n', 'nzz', default_opts)
map('n', 'N', 'Nzz', default_opts)

-- recenter after jump half page
map('n', '<M-u>', '<C-u>zz', default_opts)
map('n', '<M-d>', '<C-d>zz', default_opts)

map('n', '<C-u>', '<nop>', default_opts)
map('n', '<C-d>', '<nop>', default_opts)

-- disable yanking with select operations
map('n', 'C', '"_C', default_opts)
map('n', 'cc', '"_cc', default_opts)
map('n', 'D', '"_D', default_opts)
map('n', 'dd', '"_dd', default_opts)
map('n', 'x', '"_x', default_opts)

-- unbind Q
map('n', 'Q', '<nop>', default_opts)

-- unbind , and ;
map('n', ',', '<nop>', default_opts)
map('n', ';', '<nop>', default_opts)

-- arrow keys
map('n', '<up>', '<nop>', default_opts)
map('n', '<down>', '<nop>', default_opts)
map('n', '<left>', '<nop>', default_opts)
map('n', '<right>', '<nop>', default_opts)

map('i', '<up>', '<nop>', default_opts)
map('i', '<down>', '<nop>', default_opts)
map('i', '<left>', '<nop>', default_opts)
map('i', '<right>', '<nop>', default_opts)

map('v', '<up>', '<nop>', default_opts)
map('v', '<down>', '<nop>', default_opts)
map('v', '<left>', '<nop>', default_opts)
map('v', '<right>', '<nop>', default_opts)
