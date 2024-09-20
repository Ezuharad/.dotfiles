-- Treesitter support
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
              ["af"] = { query = "@function.outer", desc = "outer function" },
              ["if"] = { query = "@function.inner", desc = "inner function" },

              ["ac"] = { query = "@class.outer", desc = "outer class" },
              ["ic"] = { query = "@class.inner", desc = "inner class" },

              ["ao"] = { query = "@loop.outer", desc = "outer loop" },
              ["io"] = { query = "@loop.inner", desc = "inner loop" },

              ["ak"] = { query = "@block.outer", desc = "outer block" },
              ["ik"] = { query = "@block.inner", desc = "inner block" },

              ["al"] = { query = "@call.outer", desc = "outer call" },
              ["il"] = { query = "@call.inner", desc = "inner call" },

              ["ar"] = { query = "@parameter.outer", desc = "outer parameter" },
              ["ir"] = { query = "@parameter.inner", desc = "inner parameter" },

              ["ad"] = { query = "@conditional.outer", desc = "outer conditional" },
              ["id"] = { query = "@conditional.inner", desc = "inner conditional" },

              ["aa"] = { query = "@assignment.outer", desc = "outer assignment" },
              ["ia"] = { query = "@assignment.inner", desc = "inner assignment" },
            },
          },
          move = {
            enable = true,
            set_jumpts = true,
            goto_next_start = {
              ["]f"] = { query = "@function.outer", desc = "outer function" },
              ["]c"] = { query = "@class.outer", desc = "outer class" },
              ["]o"] = { query = "@loop.outer", desc = "outer loop" },
              ["]k"] = { query = "@block.outer", desc = "outer block" },
              ["]l"] = { query = "@call.outer", desc = "outer call" },
              ["]r"] = { query = "@parameter.outer", desc = "outer parameter" },
              ["]d"] = { query = "@conditional.outer", desc = "outer conditional" },
              ["]a"] = { query = "@assignment.outer", desc = "outer assignment" }
            },
            goto_next_end = {
              ["]F"] = { query = "@function.outer", desc = "outer function" },
              ["]C"] = { query = "@class.outer", desc = "outer class" },
              ["]O"] = { query = "@loop.outer", desc = "outer loop" },
              ["]K"] = { query = "@block.outer", desc = "outer block" },
              ["]L"] = { query = "@call.outer", desc = "outer call" },
              ["]R"] = { query = "@parameter.outer", desc = "outer parameter" },
              ["]D"] = { query = "@conditional.outer", desc = "outer conditional" },
              ["]A"] = { query = "@assignment.outer", desc = "outer assignment" }
            },
            goto_previous_start = {
              ["[F"] = { query = "@function.outer", desc = "outer function" },
              ["[C"] = { query = "@class.outer", desc = "outer class" },
              ["[O"] = { query = "@loop.outer", desc = "outer loop" },
              ["[K"] = { query = "@block.outer", desc = "outer block" },
              ["[L"] = { query = "@call.outer", desc = "outer call" },
              ["[R"] = { query = "@parameter.outer", desc = "outer parameter" },
              ["[D"] = { query = "@conditional.outer", desc = "outer conditional" },
              ["[A"] = { query = "@assignment.outer", desc = "outer assignment" }
            },
            goto_previous_end = {
              ["[f"] = { query = "@function.outer", desc = "outer function" },
              ["[c"] = { query = "@class.outer", desc = "outer class" },
              ["[o"] = { query = "@loop.outer", desc = "outer loop" },
              ["[k"] = { query = "@block.outer", desc = "outer block" },
              ["[l"] = { query = "@call.outer", desc = "outer call" },
              ["[r"] = { query = "@parameter.outer", desc = "outer parameter" },
              ["[d"] = { query = "@conditional.outer", desc = "outer conditional" },
              ["[a"] = { query = "@assignment.outer", desc = "outer assignment" }
            },
          },
        },
      })

      local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
      -- Repeat movement with ; and ,
      -- ensure ; goes forward and , goes backward regardless of the last direction
      -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
      -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

      -- vim way: ; goes to the direction you were moving.
      vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
      vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

      -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
      vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
      vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
      vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
      vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    opts = {
      ensure_installed = {
        "bash",
        "lua",
        "markdown",
        "regex",
        "vim",
      },
    },
  },
}
