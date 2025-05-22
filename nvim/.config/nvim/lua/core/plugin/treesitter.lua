-- treesitter integration with textobjects
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "awk",
        "bash",
        "csv",
        "diff",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "regex",
        "sql",
        "toml",
        "tsv",
        "vim",
        "vimdoc",
        "yaml",
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
      },
      indent = {
        enable = true,
      },
    },
  },
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
              ["ab"] = { query = "@block.outer", desc = "outer block" },
              ["ac"] = { query = "@class.outer", desc = "outer class" },
              ["ad"] = { query = "@conditional.outer", desc = "outer conditional" },
              ["ae"] = { query = "@return.outer", desc = "outer return" },
              ["af"] = { query = "@function.outer", desc = "outer function" },
              ["ag"] = { query = "@regex.outer", desc = "outer regex" },
              ["al"] = { query = "@call.outer", desc = "outer call" },
              ["am"] = { query = "@comment.outer", desc = "outer comment" },
              ["ao"] = { query = "@loop.outer", desc = "outer loop" },
              ["ar"] = { query = "@parameter.outer", desc = "outer parameter" },
              ["au"] = { query = "@attribute.outer", desc = "outer attribute" },

              ["ia"] = { query = "@assignment.inner", desc = "inner assignment" },
              ["ib"] = { query = "@block.inner", desc = "inner block" },
              ["ic"] = { query = "@class.inner", desc = "inner class" },
              ["id"] = { query = "@conditional.inner", desc = "inner conditional" },
              ["ie"] = { query = "@return.inner", desc = "inner return" },
              ["if"] = { query = "@function.inner", desc = "inner function" },
              ["ig"] = { query = "@regex.inner", desc = "inner regex" },
              ["il"] = { query = "@call.inner", desc = "inner call" },
              ["im"] = { query = "@comment.inner", desc = "inner comment" },
              ["io"] = { query = "@loop.inner", desc = "inner loop" },
              ["ir"] = { query = "@parameter.inner", desc = "inner parameter" },
              ["iu"] = { query = "@attribute.inner", desc = "inner attribute" },

              ["xn"] = { query = "@number.inner", desc = "number" },
              ["xs"] = { query = "@statement.outer", desc = "statement" },

              ["xl"] = { query = "@assignment.rhs", desc = "assignment rhs" },
              ["xh"] = { query = "@assignment.lhs", desc = "assignment lhs" },

              ["xg"] = { query = "@global.scope", desc = "global scope" },
              ["xc"] = { query = "@local.scope", desc = "local scope" },
            },
          },
          move = {
            enable = true,
            set_jumps = true,
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
              ["]u"] = { query = "@attribute.outer", desc = "outer attribute" },
              ["[U"] = { query = "@attribute.outer", desc = "outer attribute" },
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
              ["]U"] = { query = "@attribute.outer", desc = "outer attribute" },
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
              ["[u"] = { query = "@attribute.outer", desc = "outer attribute" },
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
              ["[U"] = { query = "@attribute.outer", desc = "outer attribute" },
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<C-l>"] = "@parameter.inner",
            },
            swap_previous = {
              ["<C-h>"] = "@parameter.inner",
            },
          },
          matchup = {
            enable = true,
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
    "andymass/vim-matchup",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    init = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
}
