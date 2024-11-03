-- AI assistant
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
    { "<leader>pa", ":PrtAsk<cr>",        desc = "Ask AI (Parrot)" },
    { "<leader>pr", ":PrtRewrite<cr>",    desc = "AI Rewrite (Parrot)" },
    { "<leader>pt", ":PrtChatToggle<cr>", desc = "Toggle AI (Parrot)" },
    { "<leader>pc", ":PrtChatNew<cr>",    desc = "AI Chat (Parrot)" },
    { "<leader>pp", ":PrtChatPaste<cr>",  desc = "AI Paste to Chat (Parrot)" },
  },
}
