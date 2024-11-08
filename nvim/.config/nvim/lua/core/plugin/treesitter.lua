-- treesitter integration with textobjects
return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      local ts_textobjects = require("nvim-treesitter.configs")
      ts_textobjects.setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["aa"] = { query = "@assignment.outer", desc = "outer assignment" },
              ["ia"] = { query = "@assignment.inner", desc = "inner assignment" },

              ["ab"] = { query = "@block.outer", desc = "outer block" },
              ["ib"] = { query = "@block.inner", desc = "inner block" },

              ["ac"] = { query = "@class.outer", desc = "outer class" },
              ["ic"] = { query = "@class.inner", desc = "inner class" },

              ["ad"] = { query = "@conditional.outer", desc = "outer conditional" },
              ["id"] = { query = "@conditional.inner", desc = "inner conditional" },

              ["ae"] = { query = "@return.outer", desc = "outer return" },
              ["ie"] = { query = "@return.inner", desc = "inner return" },

              ["af"] = { query = "@function.outer", desc = "outer function" },
              ["if"] = { query = "@function.inner", desc = "inner function" },

              ["ag"] = { query = "@regex.outer", desc = "outer regex" },
              ["ig"] = { query = "@regex.inner", desc = "inner regex" },

              ["al"] = { query = "@call.outer", desc = "outer call" },
              ["il"] = { query = "@call.inner", desc = "inner call" },

              ["am"] = { query = "@comment.outer", desc = "outer comment" },
              ["im"] = { query = "@comment.inner", desc = "inner comment" },

              ["ao"] = { query = "@loop.outer", desc = "outer loop" },
              ["io"] = { query = "@loop.inner", desc = "inner loop" },

              ["ar"] = { query = "@parameter.outer", desc = "outer parameter" },
              ["ir"] = { query = "@parameter.inner", desc = "inner parameter" },

              -- other textobjects
              ["rr"] = { query = "@assignment.rhs", desc = "assignment rhs" },
              ["rl"] = { query = "@assignment.lhs", desc = "assignment lhs" },

              ["rg"] = { query = "@global.scope", desc = "global scope" },
              ["rc"] = { query = "@local.scope", desc = "local scope" },
            },
          },
          move = {
            enable = true,
            set_jumpts = true,
            goto_next_start = {
              ["]a"] = { query = "@assignment.outer", desc = "outer assignment" },
              ["]b"] = { query = "@block.outer", desc = "outer block" },
              ["]c"] = { query = "@class.outer", desc = "outer class" },
              ["]d"] = { query = "@conditional.outer", desc = "outer conditional" },
              ["]e"] = { query = "@return.outer", desc = "outer return" },
              ["]f"] = { query = "@function.outer", desc = "outer function" },
              ["]g"] = { query = "@regex.outer", desc = "outer regex" },
              ["]l"] = { query = "@call.outer", desc = "outer call" },
              ["]m"] = { query = "@comment.outer", desc = "outer comment" },
              ["]o"] = { query = "@loop.outer", desc = "outer loop" },
              ["]r"] = { query = "@parameter.outer", desc = "outer parameter" },
            },
            goto_next_end = {
              ["]A"] = { query = "@assignment.outer", desc = "outer assignment" },
              ["]B"] = { query = "@block.outer", desc = "outer block" },
              ["]C"] = { query = "@class.outer", desc = "outer class" },
              ["]D"] = { query = "@conditional.outer", desc = "outer conditional" },
              ["]E"] = { query = "@return.outer", desc = "outer return" },
              ["]F"] = { query = "@function.outer", desc = "outer function" },
              ["]G"] = { query = "@regex.outer", desc = "outer regex" },
              ["]L"] = { query = "@call.outer", desc = "outer call" },
              ["]M"] = { query = "@comment.outer", desc = "outer comment" },
              ["]O"] = { query = "@loop.outer", desc = "outer loop" },
              ["]R"] = { query = "@parameter.outer", desc = "outer parameter" },
            },
            goto_previous_start = {
              ["[a"] = { query = "@assignment.outer", desc = "outer assignment" },
              ["[b"] = { query = "@block.outer", desc = "outer block" },
              ["[c"] = { query = "@class.outer", desc = "outer class" },
              ["[d"] = { query = "@conditional.outer", desc = "outer conditional" },
              ["[e"] = { query = "@return.outer", desc = "outer return" },
              ["[f"] = { query = "@function.outer", desc = "outer function" },
              ["[g"] = { query = "@regex.outer", desc = "outer regex" },
              ["[l"] = { query = "@call.outer", desc = "outer call" },
              ["[m"] = { query = "@comment.outer", desc = "outer comment" },
              ["[o"] = { query = "@loop.outer", desc = "outer loop" },
              ["[r"] = { query = "@parameter.outer", desc = "outer parameter" },
            },
            goto_previous_end = {
              ["[A"] = { query = "@assignment.outer", desc = "outer assignment" },
              ["[B"] = { query = "@block.outer", desc = "outer block" },
              ["[C"] = { query = "@class.outer", desc = "outer class" },
              ["[D"] = { query = "@conditional.outer", desc = "outer conditional" },
              ["[E"] = { query = "@return.outer", desc = "outer return" },
              ["[F"] = { query = "@function.outer", desc = "outer function" },
              ["[G"] = { query = "@regex.outer", desc = "outer regex" },
              ["[L"] = { query = "@call.outer", desc = "outer call" },
              ["[M"] = { query = "@comment.outer", desc = "outer comment" },
              ["[O"] = { query = "@loop.outer", desc = "outer loop" },
              ["[R"] = { query = "@parameter.outer", desc = "outer parameter" },
            },
          },
          lsp_interop = {
            enable = true,
            border = "rounded",
          },
        },
      })

      -- make motions repeat with `]]` and `[[`
      local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
      vim.keymap.set({ "n", "x", "o" }, "]]", ts_repeat_move.repeat_last_move)
      vim.keymap.set({ "n", "x", "o" }, "[[", ts_repeat_move.repeat_last_move_opposite)

      vim.keymap.set({ "v", "x", "o" }, "]]", ts_repeat_move.repeat_last_move)
      vim.keymap.set({ "v", "x", "o" }, "[[", ts_repeat_move.repeat_last_move_opposite)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup({
        matchup = {
          enable = true,
        },
        ensure_installed = {
          "bash",
          "lua",
          "markdown",
          "regex",
          "vim",
          "vimdoc",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = true,
        },
        indent = {
          enable = true,
        },
        additional_vim_regex_highlighting = true,
      })
    end
  },
}
