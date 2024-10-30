-- Custom editor keybinds
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = function(mode, lhs, rhs, desc)
  if desc then
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc})
  else
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true})
  end
end

-- keybind for find and replace
map("n", "<leader>vr", ":%s//gc<Left><Left><Left>", "Find Replace")
map("v", "<leader>vr", ":%s//gc<Left><Left><Left>", "Find Replace")

-- recenter after n and N
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- switch buffers with tab
map("n", "<tab>", "<cmd>bnext<cr>")
map("n", "<S-tab>", "<cmd>bprev<cr>")

-- recenter after jump half page
map("n", "<M-u>", "<C-u>zz")
map("n", "<M-d>", "<C-d>zz")
map("v", "<M-u>", "<C-u>zz")
map("v", "<M-d>", "<C-d>zz")

map("n", "<C-u>", "<nop>")
map("n", "<C-d>", "<nop>")
map("v", "<C-u>", "<nop>")
map("v", "<C-d>", "<nop>")

-- disable yanking with select operations
map("n", "C", '"_C')
map("n", "cc", '"_cc')
map("n", "D", '"_D')
map("n", "x", '"_x')

-- unbind Q
map("n", "Q", "<nop>")

-- unbind , and ;
map("n", ",", "<nop>")
map("n", ";", "<nop>")

-- unbind arrow keys
map("n", "<up>", "<nop>")
map("n", "<down>", "<nop>")
map("n", "<left>", "<nop>")
map("n", "<right>", "<nop>")

map("i", "<up>", "<nop>")
map("i", "<down>", "<nop>")
map("i", "<left>", "<nop>")
map("i", "<right>", "<nop>")

map("v", "<up>", "<nop>")
map("v", "<down>", "<nop>")
map("v", "<left>", "<nop>")
map("v", "<right>", "<nop>")

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "help",
    "man",
    "oil",
    "qf",
    -- dap stuff
    "dap-repl",
    "dapui_breakpoints",
    "dapui_console",
    "dapui_scopes",
    "dapui_stacks",
    "dapui_watches",

  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
  desc = "Close certain windows with 'q'"
})

