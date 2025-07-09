-- searching for files, buffers, tags, and git objects
return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "echasnovski/mini.icons", -- replaced "nvim-tree/nvim-web-devicons"
      "nvim-treesitter/nvim-treesitter",
    },
    lazy = true,
    keys = {
      -- Vim builtins
      { "<leader>fa", "<cmd>Telescope autocommands<cr>", desc = "Telescope Autocommands<cr>" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope Buffers (Telescope)" },
      { "<leader>fj", "<cmd>Telescope jumplist<cr>", desc = "Telescope Jumplist (Telescope)" },
      { "<leader>fk", "<cmd>Telescope marks<cr>", desc = "Telescope Marks (Telescope)" },
      {
        "<leader>fr",
        "<cmd>Telescope registers<cr>",
        desc = "Telescope Registers (Telescope)",
      },
      { "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = "Telescope Quickfix List (Telescope)" },

      -- Telescope builtins
      { "<leader>f?", "<cmd> Telescope<cr>", desc = "Telescope Pickers (Telescope)" },
      { "<leader>fc", "<cmd> Telescope commands<cr>", desc = "Telescope Commands (Telescope)" },

      -- Files
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope Files (Telescope)" },
      {
        "<leader>fF",
        function()
          require("telescope.builtin").find_files({ hidden = true })
        end,
        desc = "Telescope Hidden Files (Telescope)",
      },

      -- Treesitter
      { "<leader>fe", "<cmd>Telescope treesitter<cr>", desc = "Telescope Treesitter (Telescope)" },

      -- Documentation
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Telescope Help Tags (Telescope)" },
      { "<leader>fm", "<cmd>Telescope man_pages<cr>", desc = "Telescope Man Pages (Telescope)" },

      -- Strings
      { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Telescope LSP Document Symbols (Telescope)" },
      { "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Telescope LSP Workspace Symbols (Telescope)" },
      { "<leader>ft", "<cmd>Telescope live_grep<cr>", desc = "Telescope Text (Telescope)" },

      -- Fixing stuff
      { "<leader>fx", "<cmd>Telescope diagnostics<cr>", desc = "Telescope Diagnostics (Telescope)" },

      -- Git stuff
      { "<leader>gfb", "<cmd>Telescope git_branches<cr>", desc = "Telescope Git Branches (Telescope)" },
      { "<leader>gfc", "<cmd>Telescope git_commits<cr>", desc = "Telescope Git Commits (Telescope)" },
      { "<leader>gff", "<cmd>Telescope git_files<cr>", desc = "Telescope Git-Tracked Files (Telescope)" },
    },
    opts = {
      defaults = {
        file_ignore_patterns = vim.tbl_deep_extend(
          "keep",
          require("core.plugin.file.hidden"),
          { -- files to hide in telescope, but not the explorer
            "*\\.heic",
            "*\\.jpeg",
            "*\\.jpg",
            "*\\.pdf",
            "*\\.png",
            "*\\.raw",
            "*\\.zip",
          }
        ),
      },
      extensions = {
        glyph = {
          action = function(glyph)
            vim.api.nvim_put({ glyph.value }, "c", false, true)
          end,
        },
      },
    },
    cmd = {
      "Telescope",
    },
  },
  {
    "debugloop/telescope-undo.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      undo = {},
    },
    keys = {
      {
        "<leader>fu",
        "<cmd>Telescope undo<cr>",
        desc = "Telescope Undo History (Telescope-Undo)",
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("undo")
    end,
  },
  {
    "ghassan0/telescope-glyph.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>fg", "<cmd>Telescope glyph<cr>", desc = "Telescope Gylphs (Telescope-Glyph)" },
    },
  },
}
