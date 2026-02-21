-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

-- Use alt for navigation
map("n", "<M-u>", "<C-u>zz")
map("n", "<M-d>", "<C-d>zz")
map("v", "<M-u>", "<C-u>zz")
map("v", "<M-d>", "<C-d>zz")

map("n", "<C-u>", "<nop>")
map("n", "<C-d>", "<nop>")
map("v", "<C-u>", "<nop>")
map("v", "<C-d>", "<nop>")

map("n", "<C-h>", "<nop>")
map("v", "<C-h>", "<nop>")
map("n", "<C-j>", "<nop>")
map("v", "<C-j>", "<nop>")
map("n", "<C-k>", "<nop>")
map("n", "<C-k>", "<nop>")
map("v", "<C-l>", "<nop>")
map("v", "<C-l>", "<nop>")

-- use \ for vsplit
map("n", "<leader>\\", "<cmd>vsplit<cr>")

map("n", "<leader>|", "<nop>")
