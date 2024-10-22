-- AI assistant support
return {
  "frankroeder/parrot.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  lazy = true,
  opts = {
    providers = {
      github = {
        api_key = os.getenv("GITHUB_TOKEN"),
      },
    },
  },
  keys = {
    { "<leader>pa", ":PrtAsk<cr>",        desc = "Ask AI Question (Parrot)" },
    { "<leader>pr", ":PrtRewrite<cr>",    desc = "Rewrite Visual Selection with AI (Parrot)" },
    { "<leader>pt", ":PrtChatToggle<cr>", desc = "Toggle AI Chat (Parrot)" },
    { "<leader>pc", ":PrtChatNew<cr>",    desc = "New AI Chat (Parrot)" },
    { "<leader>pp", ":PrtChatPaste<cr>",  desc = "Paste Visual Selection into AI Chat (Parrot)" },
  },
}
