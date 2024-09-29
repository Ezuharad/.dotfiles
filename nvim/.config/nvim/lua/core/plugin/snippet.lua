-- Snippets engine support
return {
	{
		"mireq/luasnip-snippets",
		dependencies = { "L3MON4D3/LuaSnip" },
		init = function()
			require("luasnip_snippets.common.snip_utils").setup()
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		init = function()
			require("luasnip").setup({
				load_ft_func = require("luasnip_snippets.common.snip_utils").load_ft_func,
				ft_func = require("luasnip_snippets.common.snip_utils").ft_func,
			})
		end,
	},
}
