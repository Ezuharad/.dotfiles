-- Add a closing bracket whenever an opening bracket is inserted
-- TODO: add treesitter support
return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = true,
	lazy = true,
}
