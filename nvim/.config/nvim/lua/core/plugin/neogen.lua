-- automatic doc generation
return {
  {
    "danymat/neogen",
    dependencies = {
      "L3MON4D3/LuaSnip",
    },
    config = true,
    lazy = true,
    opts = {
      languages = require("core.plugin.neogen.config"),
      snippet_engine = "luasnip",
    },
    keys = {
      {
        "grd",
        function()
          require("neogen").generate()
        end,
        desc = "Generate Documentation Stub (Neogen)",
      },
    },
  },
}
