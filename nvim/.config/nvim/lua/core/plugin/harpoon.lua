-- Harpoon list
return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    enabled = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()
    end,
    keys = {
      {
        "<leader>ha",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Add Current Position (Harpoon)",
      },
      {
        "<leader>hl",
        function()
          require("harpoon"):list():next()
        end,
        desc = "Jump Next Position (Harpoon)",
      },
      {
        "<leader>hh",
        function()
          require("harpoon"):list():prev()
        end,
        desc = "Jump Previous Harpoon (Harpoon)",
      },
    },
  },
}
