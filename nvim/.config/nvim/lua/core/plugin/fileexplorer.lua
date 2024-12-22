-- file explorer
return {
  "echasnovski/mini.files",
  config = true,
  opts = {
    windows = {
      preview = true,
    },
  },
  keys = {
    {
      "-",
      function()
        require("mini.files").open()
      end,
      desc = "Open File Explorer (Mini.Files)",
    },
  },
}
