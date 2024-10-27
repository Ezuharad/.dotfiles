-- set 'q' to close certain windows
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

-- mason transparent background
vim.cmd("autocmd FileType mason setlocal winblend=0")

