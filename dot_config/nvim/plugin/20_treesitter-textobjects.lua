vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
    version = "main",
  }
})

-- Disable entire built-in ftplugin mappings to avoid conflicts.
-- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
vim.g.no_plugin_maps = true
-- Or, disable per filetype (add as you like)
-- vim.g.no_python_maps = true
-- vim.g.no_ruby_maps = true
-- vim.g.no_rust_maps = true
-- vim.g.no_go_maps = true

require("nvim-treesitter-textobjects").setup {
  select = {
    lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
  },
  move = {
    set_jumps = true, -- whether to set jumps in the jumplist
  },
}

-- KEYMAPS

-- SELECT

local select = require "nvim-treesitter-textobjects.select".select_textobject

Map({ "x", "o" }, "aj", function() select("@local.scope", "locals") end, { desc = 'Around scope' })

Map({ "x", "o" }, "am", function() select("@function.outer", "textobjects") end, { desc = 'Around function' })
Map({ "x", "o" }, "im", function() select("@function.inner", "textobjects") end, { desc = 'Inside function' })

Map({ "x", "o" }, "af", function() select("@call.outer", "textobjects") end, { desc = 'Around call' })
Map({ "x", "o" }, "if", function() select("@call.inner", "textobjects") end, { desc = 'Inside call' })

Map({ "x", "o" }, "ak", function() select("@class.outer", "textobjects") end, { desc = 'Around class' })
Map({ "x", "o" }, "ik", function() select("@class.inner", "textobjects") end, { desc = 'Inside class' })

Map({ "x", "o" }, "a/", function() select("@comment.outer", "textobjects") end, { desc = 'Around comment' })
Map({ "x", "o" }, "i/", function() select("@comment.inner", "textobjects") end, { desc = 'Inside comment' })

Map({ "x", "o" }, "ac", function() select("@conditional.outer", "textobjects") end, { desc = 'Around conditional' })
Map({ "x", "o" }, "ic", function() select("@conditional.inner", "textobjects") end, { desc = 'Inside conditional' })

Map({ "x", "o" }, "ao", function() select("@loop.outer", "textobjects") end, { desc = 'Around loop' })
Map({ "x", "o" }, "io", function() select("@loop.inner", "textobjects") end, { desc = 'Inside loop' })

Map({ "x", "o" }, "au", function() select("@block.outer", "textobjects") end, { desc = 'Around block' })
Map({ "x", "o" }, "iu", function() select("@block.inner", "textobjects") end, { desc = 'Inside block' })

-- MOVE

local next_start = require("nvim-treesitter-textobjects.move").goto_next_start
local next_end = require("nvim-treesitter-textobjects.move").goto_next_end
local previous_start = require("nvim-treesitter-textobjects.move").goto_previous_start
local previous_end = require("nvim-treesitter-textobjects.move").goto_previous_end

Map({ "n", "x", "o" }, "]m", function() next_start("@function.outer", "textobjects") end, { desc = 'Next function start' })
Map({ "n", "x", "o" }, "]M", function() next_end("@function.outer", "textobjects") end, { desc = 'Next function end' })
Map({ "n", "x", "o" }, "[m", function() previous_start("@function.outer", "textobjects") end, { desc = 'Previous function start' })
Map({ "n", "x", "o" }, "[M", function() previous_end("@function.outer", "textobjects") end, { desc = 'Previous function end' })

Map({ "n", "x", "o" }, "]f", function() next_start("@call.outer", "textobjects") end, { desc = 'Next call start' })
Map({ "n", "x", "o" }, "]F", function() next_end("@call.outer", "textobjects") end, { desc = 'Next call end' })
Map({ "n", "x", "o" }, "[f", function() previous_start("@call.outer", "textobjects") end, { desc = 'Previous call start' })
Map({ "n", "x", "o" }, "[F", function() previous_end("@call.outer", "textobjects") end, { desc = 'Previous call end' })

Map({ "n", "x", "o" }, "]k", function() next_start("@class.outer", "textobjects") end, { desc = 'Next class start' })
Map({ "n", "x", "o" }, "]K", function() next_end("@class.outer", "textobjects") end, { desc = 'Next class end' })
Map({ "n", "x", "o" }, "[k", function() previous_start("@class.outer", "textobjects") end, { desc = 'Previous class start' })
Map({ "n", "x", "o" }, "[K", function() previous_end("@class.outer", "textobjects") end, { desc = 'Previous class end' })

Map({ "n", "x", "o" }, "]/", function() next_start("@comment.outer", "textobjects") end, { desc = 'Next comment start' })
Map({ "n", "x", "o" }, "]?", function() next_end("@comment.outer", "textobjects") end, { desc = 'Next comment end' })
Map({ "n", "x", "o" }, "[/", function() previous_start("@comment.outer", "textobjects") end, { desc = 'Previous comment start' })
Map({ "n", "x", "o" }, "[?", function() previous_end("@comment.outer", "textobjects") end, { desc = 'Previous comment end' })

Map({ "n", "x", "o" }, "]c", function() next_start("@conditional.outer", "textobjects") end, { desc = 'Next conditional start' })
Map({ "n", "x", "o" }, "]C", function() next_end("@conditional.outer", "textobjects") end, { desc = 'Next conditional end' })
Map({ "n", "x", "o" }, "[c", function() previous_start("@conditional.outer", "textobjects") end, { desc = 'Previous conditional start' })
Map({ "n", "x", "o" }, "[C", function() previous_end("@conditional.outer", "textobjects") end, { desc = 'Previous conditional end' })

Map({ "n", "x", "o" }, "]o", function() next_start("@loop.outer", "textobjects") end, { desc = 'Next loop start' })
Map({ "n", "x", "o" }, "]O", function() next_end("@loop.outer", "textobjects") end, { desc = 'Next loop end' })
Map({ "n", "x", "o" }, "[o", function() previous_start("@loop.outer", "textobjects") end, { desc = 'Previous loop start' })
Map({ "n", "x", "o" }, "[O", function() previous_end("@loop.outer", "textobjects") end, { desc = 'Previous loop end' })

Map({ "n", "x", "o" }, "]j", function() next_start("@local.scope", "locals") end, { desc = 'Next scope start' })
Map({ "n", "x", "o" }, "]J", function() next_end("@local.scope", "locals") end, { desc = 'Next scope end' })
Map({ "n", "x", "o" }, "[j", function() previous_start("@local.scope", "locals") end, { desc = 'Previous scope start' })
Map({ "n", "x", "o" }, "[J", function() previous_end("@local.scope", "locals") end, { desc = 'Previous scope end' })

Map({ "n", "x", "o" }, "]z", function() next_start("@fold", "folds") end, { desc = 'Next fold start' })
Map({ "n", "x", "o" }, "]Z", function() next_end("@fold", "folds") end, { desc = 'Next fold end' })
Map({ "n", "x", "o" }, "[z", function() previous_start("@fold", "folds") end, { desc = 'Previous fold start' })
Map({ "n", "x", "o" }, "[Z", function() previous_end("@fold", "folds") end, { desc = 'Previous fold end' })

Map({ "n", "x", "o" }, "]]", function() next_start("@block.outer", "textobjects") end, { desc = 'Next block start' })
Map({ "n", "x", "o" }, "][", function() next_end("@block.outer", "textobjects") end, { desc = 'Next block end' })
Map({ "n", "x", "o" }, "[[", function() previous_start("@block.outer", "textobjects") end, { desc = 'Previous block start' })
Map({ "n", "x", "o" }, "[]", function() previous_end("@block.outer", "textobjects") end, { desc = 'Previous block end' })
