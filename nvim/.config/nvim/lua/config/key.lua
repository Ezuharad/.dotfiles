-- custom editor keybinds
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = function(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

-- recenter after n and N
map("n", "n", "nzz")
map("n", "N", "Nzz")

map("v", "n", "nzz")
map("v", "N", "Nzz")

-- recenter after jump half page
map("n", "<M-u>", "<C-u>zz")
map("n", "<M-d>", "<C-d>zz")
map("v", "<M-u>", "<C-u>zz")
map("v", "<M-d>", "<C-d>zz")

map("n", "<C-u>", "<nop>")
map("n", "<C-d>", "<nop>")
map("v", "<C-u>", "<nop>")
map("v", "<C-d>", "<nop>")

-- recenter after jump to previous position
map("n", "<C-o>", "<C-o>zz")

-- recenter after line jump
map("n", "G", "Gzz")

-- keybind for find and replace
map("n", "?", ":%s//gc<Left><Left><Left>", "Find Replace")
map("v", "?", ":s/\\%V\\%V/cg<Left><Left><Left>", "Find Replace")

-- LSP keybinds
map("n", "<leader>ra", vim.lsp.buf.code_action, "Code Actions")
map("n", "<leader>rf", vim.lsp.buf.format, "Format Code")
map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
map("n", "<leader>rs", vim.lsp.buf.signature_help, "Signature Help")
map("n", "<leader>ri", vim.lsp.buf.implementation, "Go to Implementation")
map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
map("n", "<leader>rr", vim.lsp.buf.references, "Go to References")

-- switch buffers with tab
map("n", "<tab>", "<cmd>bnext<cr>")
map("n", "<S-tab>", "<cmd>bprev<cr>")
map("v", "<tab>", "<cmd>bnext<cr>")
map("v", "<S-tab>", "<cmd>bprev<cr>")

-- use ^ instead of _
map("n", "^", "_")
map("v", "^", "")

-- unbind unused keys
map("n", "gs", "<nop>")
map("n", "H", "<nop>")
map("n", "L", "<nop>")
map("n", "M", "<nop>")
map("n", "Q", "<nop>")
map("n", ",", "<nop>")
map("n", ";", "<nop>")
map("n", "_", "<nop>")

map("v", "gs", "<nop>")
map("v", "H", "<nop>")
map("v", "L", "<nop>")
map("v", "M", "<nop>")
map("v", "Q", "<nop>")
map("v", ",", "<nop>")
map("v", ";", "<nop>")
map("v", "_", "<nop>")

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

		"[No Name]",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
	desc = "Close certain windows with 'q'",
})
