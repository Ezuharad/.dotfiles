-- rainbow colored braces and autopairing
return {
  {  -- Rainbow color matching off brackets
    "HiPhish/rainbow-delimiters.nvim"
  },
  {  -- Add a closing bracket whenever an opening bracket is inserted
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    lazy = true,
    opts = {
      check_ts = true,
      ts_config = {
        lua = { "string" },
        python = { "string" },
        rust = { "raw_string_literal", "string_literal" }
      }
    }
  },
}
