-- allow toggling of values with <C-a>, <C-x>
return {
  "nat-418/boole.nvim",
  lazy = false,
  opts = {
    mappings = {
      increment = "<C-a>",
      decrement = "<C-x>"
    }
  },
}
