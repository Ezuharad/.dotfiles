-- Additional motions for fast cursor movement
return {
  "ggandor/leap.nvim",
  dependencies = {"tpope/vim-repeat"},
  config = function()
    local leap = require("leap")
    leap.create_default_mappings()
  end
}
