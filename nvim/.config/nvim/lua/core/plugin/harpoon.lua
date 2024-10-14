-- Harpoon list
return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()
    end,
    keys = {
      { "<leader>ha", function() require("harpoon"):list():add() end,  desc = "Add current position to harpoon (Harpoon)" },
      { "<leader>hl", function() require("harpoon"):list():next() end, desc = "Jump to next harpoon (Harpoon)" },
      { "<leader>hh", function() require("harpoon"):list():prev() end, desc = "Jump to previous harpoon (Harpoon)" },
    },
  },
}
