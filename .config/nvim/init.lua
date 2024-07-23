-- setup lazy.nvim
require("config")

vim.cmd("colorscheme " .. vim.g.config.theme.name)

if vim.fn.argc() == 0 then
	vim.cmd("Alpha")
end
