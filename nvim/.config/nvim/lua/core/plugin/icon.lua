-- icon support
return {
  {
    "echasnovski/mini.icons",
    config = true,
    lazy = true,
    specs = {
      { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
    },
    init = function()  -- tricky hack by folke to use as nvim_web_devicons https://www.reddit.com/r/neovim/comments/1duf3w7/miniicons_general_icon_provider_several/
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },
}
