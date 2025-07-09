-- AI assistant
return {
  { -- TODO: figure out what this thing can do. Look into diffview
    "yetone/avante.nvim",
    lazy = true,
    event = "VeryLazy",
    version = false,
    build = "make BUILD_FROM_SOURCE=true",
    opts = {
      provider = "claude",
      providers = {
        claude = {
          endpoint = "https://api.anthropic.com",
          model = "claude-3-5-sonnet-20241022",
          api_key_name = "ANTHROPIC_API_KEY",
          extra_request_body = {
            temperature = 0,
            max_tokens = 4096,
          },
        },
      },
      -- rag_service = {
      --   enabled = true,
      --   host_mount = os.getenv("HOME") .. "Code",
      --   runner = "docker",
      --   llm = {
      --     endpoint = "https://api.anthropic.com",
      --     provider = "claude",
      --     model = "claude-sonnet-4-20250514",
      --     api_key = "ANTHROPIC_API_KEY",
      --     extra = {}
      --   },
      --   embed = {
      --     provider = "claude"
      --   },
      --   docker_extra_args = ""
      -- },
      -- mode = "agentic",
      auto_suggestions = true,
      -- UI configuration
      behaviour = {
        auto_suggestions = false, -- Disable auto suggestions
        auto_set_highlight_group = true,
        auto_set_keymaps = false,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
      },
      file_selector = {
        provider = "telescope",
      },
      hints = {
        enabled = false,
      },
      windows = {
        ask = {
          start_insert = true,
        },
        edit = {
          border = "rounded",
        },
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
      "echasfovski/mini.icons",
      "sindrets/diffview.nvim",
      "zbirenbaum/copilot.lua",
    },
    keys = {
      { "<leader>aa", "<cmd>AvanteAsk<cr>", desc = "Ask About Selection (Avante)" },
      { "<leader>ad", "<cmd>AvanteChat<cr>", desc = "AI Chat (Avante)" },
      { "<leader>at", "<cmd>AvanteToggle<cr>", desc = "Toggle AI Sidebar (Avante)" },
      { "<leader>al", "<cmd>AvanteClear<cr>", desc = "Clear AI Sidebar (Avante)" },
      { "<leader>am", "<cmd>AvanteModels<cr>", desc = "Show Models (Avante)" },
      { "<leader>ah", "<cmd>AvanteHistory<cr>", desc = "Show AI History (Avante)" },
      { "<leader>ae", ":AvanteEdit<cr>", desc = "Edit Selection (Avante)", mode = "v" }, -- uce ":" for visual mode
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    lazy = true,
    opts = {
      file_types = { "markdown", "Avante" },
    },
    ft = { "markdown", "Avante" },
  },
}
