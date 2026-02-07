return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  init = function()
    -- Disable entire built-in ftplugin mappings to avoid conflicts.
    -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
    vim.g.no_plugin_maps = true

    -- Or, disable per filetype (add as you like)
    -- vim.g.no_python_maps = true
    -- vim.g.no_ruby_maps = true
    -- vim.g.no_rust_maps = true
    -- vim.g.no_go_maps = true
    end,
    config = function()
      require("nvim-treesitter-textobjects").setup {
        select = {
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        },
        move = {
          set_jumps = true, -- whether to set jumps in the jumplist
        },
      }

      -- KEYMAPS

      local km = vim.keymap.set

      -- SELECT

      local select = require "nvim-treesitter-textobjects.select".select_textobject

      km({ "x", "o" }, "aj", function() select("@local.scope", "locals") end, { desc = 'Around scope' })

      km({ "x", "o" }, "am", function() select("@function.outer", "textobjects") end, { desc = 'Around function' })
      km({ "x", "o" }, "im", function() select("@function.inner", "textobjects") end, { desc = 'Inside function' })

      km({ "x", "o" }, "af", function() select("@call.outer", "textobjects") end, { desc = 'Around call' })
      km({ "x", "o" }, "if", function() select("@call.inner", "textobjects") end, { desc = 'Inside call' })

      km({ "x", "o" }, "ak", function() select("@class.outer", "textobjects") end, { desc = 'Around class' })
      km({ "x", "o" }, "ik", function() select("@class.inner", "textobjects") end, { desc = 'Inside class' })

      km({ "x", "o" }, "a/", function() select("@comment.outer", "textobjects") end, { desc = 'Around comment' })
      km({ "x", "o" }, "i/", function() select("@comment.inner", "textobjects") end, { desc = 'Inside comment' })

      km({ "x", "o" }, "ac", function() select("@conditional.outer", "textobjects") end, { desc = 'Around conditional' })
      km({ "x", "o" }, "ic", function() select("@conditional.inner", "textobjects") end, { desc = 'Inside conditional' })

      km({ "x", "o" }, "ao", function() select("@loop.outer", "textobjects") end, { desc = 'Around loop' })
      km({ "x", "o" }, "io", function() select("@loop.inner", "textobjects") end, { desc = 'Inside loop' })

      km({ "x", "o" }, "au", function() select("@block.outer", "textobjects") end, { desc = 'Around block' })
      km({ "x", "o" }, "iu", function() select("@block.inner", "textobjects") end, { desc = 'Inside block' })

      -- MOVE

      next_start = require("nvim-treesitter-textobjects.move").goto_next_start
      next_end = require("nvim-treesitter-textobjects.move").goto_next_end
      previous_start = require("nvim-treesitter-textobjects.move").goto_previous_start
      previous_end = require("nvim-treesitter-textobjects.move").goto_previous_end

      km({ "n", "x", "o" }, "]m", function() next_start("@function.outer", "textobjects") end, { desc = 'Next function start' })
      km({ "n", "x", "o" }, "]M", function() next_end("@function.outer", "textobjects") end, { desc = 'Next function end' })
      km({ "n", "x", "o" }, "[m", function() previous_start("@function.outer", "textobjects") end, { desc = 'Previous function start' })
      km({ "n", "x", "o" }, "[M", function() previous_end("@function.outer", "textobjects") end, { desc = 'Previous function end' })

      km({ "n", "x", "o" }, "]f", function() next_start("@call.outer", "textobjects") end, { desc = 'Next call start' })
      km({ "n", "x", "o" }, "]F", function() next_end("@call.outer", "textobjects") end, { desc = 'Next call end' })
      km({ "n", "x", "o" }, "[f", function() previous_start("@call.outer", "textobjects") end, { desc = 'Previous call start' })
      km({ "n", "x", "o" }, "[F", function() previous_end("@call.outer", "textobjects") end, { desc = 'Previous call end' })

      km({ "n", "x", "o" }, "]k", function() next_start("@class.outer", "textobjects") end, { desc = 'Next class start' })
      km({ "n", "x", "o" }, "]K", function() next_end("@class.outer", "textobjects") end, { desc = 'Next class end' })
      km({ "n", "x", "o" }, "[k", function() previous_start("@class.outer", "textobjects") end, { desc = 'Previous class start' })
      km({ "n", "x", "o" }, "[K", function() previous_end("@class.outer", "textobjects") end, { desc = 'Previous class end' })

      km({ "n", "x", "o" }, "]/", function() next_start("@comment.outer", "textobjects") end, { desc = 'Next comment start' })
      km({ "n", "x", "o" }, "]?", function() next_end("@comment.outer", "textobjects") end, { desc = 'Next comment end' })
      km({ "n", "x", "o" }, "[/", function() previous_start("@comment.outer", "textobjects") end, { desc = 'Previous comment start' })
      km({ "n", "x", "o" }, "[?", function() previous_end("@comment.outer", "textobjects") end, { desc = 'Previous comment end' })

      km({ "n", "x", "o" }, "]c", function() next_start("@conditional.outer", "textobjects") end, { desc = 'Next conditional start' })
      km({ "n", "x", "o" }, "]C", function() next_end("@conditional.outer", "textobjects") end, { desc = 'Next conditional end' })
      km({ "n", "x", "o" }, "[c", function() previous_start("@conditional.outer", "textobjects") end, { desc = 'Previous conditional start' })
      km({ "n", "x", "o" }, "[C", function() previous_end("@conditional.outer", "textobjects") end, { desc = 'Previous conditional end' })

      km({ "n", "x", "o" }, "]o", function() next_start("@loop.outer", "textobjects") end, { desc = 'Next loop start' })
      km({ "n", "x", "o" }, "]O", function() next_end("@loop.outer", "textobjects") end, { desc = 'Next loop end' })
      km({ "n", "x", "o" }, "[o", function() previous_start("@loop.outer", "textobjects") end, { desc = 'Previous loop start' })
      km({ "n", "x", "o" }, "[O", function() previous_end("@loop.outer", "textobjects") end, { desc = 'Previous loop end' })

      km({ "n", "x", "o" }, "]j", function() next_start("@local.scope", "locals") end, { desc = 'Next scope start' })
      km({ "n", "x", "o" }, "]J", function() next_end("@local.scope", "locals") end, { desc = 'Next scope end' })
      km({ "n", "x", "o" }, "[j", function() previous_start("@local.scope", "locals") end, { desc = 'Previous scope start' })
      km({ "n", "x", "o" }, "[J", function() previous_end("@local.scope", "locals") end, { desc = 'Previous scope end' })

      km({ "n", "x", "o" }, "]z", function() next_start("@fold", "folds") end, { desc = 'Next fold start' })
      km({ "n", "x", "o" }, "]Z", function() next_end("@fold", "folds") end, { desc = 'Next fold end' })
      km({ "n", "x", "o" }, "[z", function() previous_start("@fold", "folds") end, { desc = 'Previous fold start' })
      km({ "n", "x", "o" }, "[Z", function() previous_end("@fold", "folds") end, { desc = 'Previous fold end' })

      km({ "n", "x", "o" }, "]]", function() next_start("@block.outer", "textobjects") end, { desc = 'Next block start' })
      km({ "n", "x", "o" }, "][", function() next_end("@block.outer", "textobjects") end, { desc = 'Next block end' })
      km({ "n", "x", "o" }, "[[", function() previous_start("@block.outer", "textobjects") end, { desc = 'Previous block start' })
      km({ "n", "x", "o" }, "[]", function() previous_end("@block.outer", "textobjects") end, { desc = 'Previous block end' })
    end
}
