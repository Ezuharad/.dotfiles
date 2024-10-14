-- automatic doc generation
return {
  {
    "danymat/neogen",
    dependencies = {
      "L3MON4D3/LuaSnip",
    },
    config = true,
    lazy = true,
    -- event = "VeryLazy",
    opts = {
      languages = require("core.plugin.neogen.config"),
      snippet_engine = "luasnip",
    },
    keys = {
      {
        "<leader>rd",
        function()
          require("neogen").generate()
        end,
        desc = "Generate Documentation Stub (Neogen)",
      },
    },
  },
}
