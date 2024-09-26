-- AI assistant support
return {
  "frankroeder/parrot.nvim",
  enabled = false,  -- TODO: wait for waitlist
  dependencies = "nvim-lua/plenary.nvim",
  opts = {
    providers = {
      github = {
        api_key = os.getenv("GITHUB_TOKEN"),
      }
    }
  }
}

