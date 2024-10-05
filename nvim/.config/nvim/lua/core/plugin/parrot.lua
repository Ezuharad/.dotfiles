-- AI assistant support
return {
  "frankroeder/parrot.nvim",
  enabled = true,
  dependencies = "nvim-lua/plenary.nvim",
  lazy = false,

  opts = {
    providers = {
      github = {
        api_key = os.getenv("GITHUB_TOKEN"),
      }
    }
  }
}
