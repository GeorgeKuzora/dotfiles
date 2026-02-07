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
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['ak'] = { query = '@block.outer', desc = 'around block' },
          ['ik'] = { query = '@block.inner', desc = 'inside block' },
          ['ac'] = { query = '@class.outer', desc = 'around class' },
          ['ic'] = { query = '@class.inner', desc = 'inside class' },
          ['a?'] = { query = '@conditional.outer', desc = 'around conditional' },
          ['i?'] = { query = '@conditional.inner', desc = 'inside conditional' },
          ['am'] = { query = '@function.outer', desc = 'around function ' },
          ['im'] = { query = '@function.inner', desc = 'inside function ' },
          ['af'] = { query = '@call.outer', desc = 'Select outer part of a function call' },
          ['if'] = { query = '@call.inner', desc = 'Select inner part of a function call' },
          ['al'] = { query = '@loop.outer', desc = 'around loop' },
          ['il'] = { query = '@loop.inner', desc = 'inside loop' },
          ['aa'] = { query = '@parameter.outer', desc = 'around argument' },
          ['ia'] = { query = '@parameter.inner', desc = 'inside argument' },
          ['a='] = { query = '@assignment.outer', desc = 'Select outer part of an assignment' },
          ['i='] = { query = '@assignment.inner', desc = 'Select inner part of an assignment' },
          ['R='] = { query = '@assignment.lhs', desc = 'Select left hand side of an assignment' },
          ['r='] = { query = '@assignment.rhs', desc = 'Select right hand side of an assignment' },
          ['a:'] = { query = '@property.outer', desc = 'Select outer part of an object property' },
          ['i:'] = { query = '@property.inner', desc = 'Select inner part of an object property' },
          ['R:'] = { query = '@property.lhs', desc = 'Select left part of an object property' },
          ['r:'] = { query = '@property.rhs', desc = 'Select right part of an object property' },
          ['a/'] = { query = '@comment.outer', desc = 'around comment' },
          ['i/'] = { query = '@comment.inner', desc = 'inside comment' },
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          [']k'] = { query = '@block.outer', desc = 'Next block start' },
          [']m'] = { query = '@function.outer', desc = 'Next function start' },
          [']a'] = { query = '@parameter.inner', desc = 'Next argument start' },
          [']c'] = { query = '@class.outer', desc = 'Next class start' },
          [']f'] = { query = '@call.outer', desc = 'Next function call start' },
          [']?'] = { query = '@conditional.outer', desc = 'Next conditional start' },
          [']l'] = { query = '@loop.outer', desc = 'Next loop start' },
        },
        goto_next_end = {
          [']K'] = { query = '@block.outer', desc = 'Next block end' },
          [']M'] = { query = '@function.outer', desc = 'Next function end' },
          [']A'] = { query = '@parameter.inner', desc = 'Next argument end' },
          [']C'] = { query = '@class.outer', desc = 'Next class end' },
          [']F'] = { query = '@call.outer', desc = 'Next function call end' },
          [']!'] = { query = '@conditional.outer', desc = 'Next conditional end' },
          [']L'] = { query = '@loop.outer', desc = 'Next loop end' },
        },
        goto_previous_start = {
          ['[k'] = { query = '@block.outer', desc = 'Previous block start' },
          ['[m'] = { query = '@function.outer', desc = 'Previous function start' },
          ['[a'] = { query = '@parameter.inner', desc = 'Previous argument start' },
          ['[c'] = { query = '@class.outer', desc = 'Previous class start' },
          ['[f'] = { query = '@call.outer', desc = 'Prev function call start' },
          ['[?'] = { query = '@conditional.outer', desc = 'Prev conditional start' },
          ['[l'] = { query = '@loop.outer', desc = 'Prev loop start' },
        },
        goto_previous_end = {
          ['[K'] = { query = '@block.outer', desc = 'Previous block end' },
          ['[M'] = { query = '@function.outer', desc = 'Previous function end' },
          ['[A'] = { query = '@parameter.inner', desc = 'Previous argument end' },
          ['[C'] = { query = '@class.outer', desc = 'Previous class end' },
          ['[F'] = { query = '@call.outer', desc = 'Prev function call end' },
          ['[!'] = { query = '@conditional.outer', desc = 'Prev conditional end' },
          ['[L'] = { query = '@loop.outer', desc = 'Prev loop end' },
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>]k'] = { query = '@block.outer', desc = 'Swap next block' },
          ['<leader>]m'] = { query = '@function.outer', desc = 'Swap next function' },
          ['<leader>]a'] = { query = '@parameter.inner', desc = 'Swap next argument' },
          ['<leader>]:'] = { query = '@property.outer', desc = 'Swap next property' },
          ['<leader>]c'] = { query = '@class.outer', desc = 'Swap next class' },
        },
        swap_previous = {
          ['<leader>[k'] = { query = '@block.outer', desc = 'Swap previous block' },
          ['<leader>[m'] = { query = '@function.outer', desc = 'Swap previous function' },
          ['<leader>[a'] = { query = '@parameter.inner', desc = 'Swap previous argument' },
          ['<leader>[:'] = { query = '@property.outer', desc = 'Swap previous property' },
          ['<leader>[c'] = { query = '@class.outer', desc = 'Swap previous class' },
        },
      },
    }
  end,
}
