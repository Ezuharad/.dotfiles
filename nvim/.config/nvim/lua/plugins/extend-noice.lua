return {
  "folke/noice.nvim",
  opts = {
    routes = {
      filter = {
        event = "msg_show",
        kind = "",
        any = {
          { find = "%d fewer lines" },
          { find = "%d more lines" },
          { find = "%d lines <ed %d time[s]?" },
          { find = "%d lines >ed %d time[s]?" },
          { find = "%d lines yanked" },
        },
      },
      opts = { skip = true },
    },
  },
}
