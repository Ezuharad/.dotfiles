-- TODO: add treesitter support
return {
  {  -- Rainbow color matching on brackets
    "HiPhish/rainbow-delimiters.nvim"
  },
  {  -- Add a closing bracket whenever an opening bracket is inserted
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    lazy = true,
  },
}
