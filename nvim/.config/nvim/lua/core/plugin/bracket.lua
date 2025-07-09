return {
  {  -- Rainbow color matching off brackets
    "HiPhish/rainbow-delimiters.nvim"
  },
  -- {
  --   "echasnovski/mini.pairs",
  --   opts = {
  --     modes = {
  --       insert = true,
  --       command = false,
  --       terminal = false
  --     }
  --   }
  -- },
  -- {
  --   "echasnovski/mini.surround",
  --   opts = {
  --     mappings = {
  --       add = "gsa",
  --       delete = "gsd",
  --       find = "gsf",
  --       find_left = "gsF",
  --       highlight = "gsh",
  --       replace = "gsr",
  --       update_n_luines = "gsn"
  --     }
  --   }
  -- },
  {  -- surround with brackets
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = true
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
