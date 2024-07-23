-- set 'q' to close certain windows
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"help",
		"man",
		"oil",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true})
	end,
	desc = "Close certain windows with 'q'"
})
