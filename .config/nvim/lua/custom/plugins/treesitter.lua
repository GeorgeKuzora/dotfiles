return {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    {
      'nvim-treesitter/nvim-treesitter-context',
      config = function()
        require('treesitter-context').setup { max_lines = 5 }
      end,
    },
    {
      'JoosepAlviste/nvim-ts-context-commentstring',
      config = function()
        require('ts_context_commentstring').setup { enable_autocmd = false }
      end,
    },
    'nvim-treesitter/nvim-treesitter-refactor',
    {
      'windwp/nvim-ts-autotag',
      config = function()
        require('nvim-ts-autotag').setup()
      end,
    },
  },
  cmd = {
    'TSBufDisable',
    'TSBufEnable',
    'TSBufToggle',
    'TSDisable',
    'TSEnable',
    'TSToggle',
    'TSInstall',
    'TSInstallInfo',
    'TSInstallSync',
    'TSModuleInfo',
    'TSUninstall',
    'TSUpdate',
    'TSUpdateSync',
  },
  build = ':TSUpdate',
  config = vim.defer_fn(function()
    require('nvim-treesitter.configs').setup {
      -- Add languages to be installed here that you want installed for treesitter
      ensure_installed = {
        'lua',
        'python',
        'typescript',
        'vimdoc',
        'vim',
        'html',
        'css',
        'sql',
        'yaml',
        'bash',
        'markdown',
        'regex',
        'markdown_inline',
        'go',
      },
      -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
        disable = function(_, bufnr)
          return vim.b[bufnr].large_buf
        end,
      },
      indent = { enable = true, disable = { 'ruby' } },
      refactor = {
        highlight_definitions = {
          enable = true,
          -- Set to false if you have an `updatetime` of ~100.
          clear_on_cursor_move = true,
        },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          scope_incremental = '<c-s>',
          node_decremental = '<bs>',
        },
      },
      rainbow = {
        enable = true,
        disable = {}, -- list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
        hlgroups = {
          'TSRainbowRed',
          'TSRainbowYellow',
          'TSRainbowBlue',
          'TSRainbowOrange',
          'TSRainbowGreen',
          'TSRainbowViolet',
          'TSRainbowCyan',
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['ak'] = { query = '@block.outer', desc = 'around block' },
            ['ik'] = { query = '@block.inner', desc = 'inside block' },
            ['ac'] = { query = '@class.outer', desc = 'around class' },
            ['ic'] = { query = '@class.inner', desc = 'inside class' },
            ['ai'] = { query = '@conditional.outer', desc = 'around conditional' },
            ['ii'] = { query = '@conditional.inner', desc = 'inside conditional' },
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
            [']i'] = { query = '@conditional.outer', desc = 'Next conditional start' },
          },
          goto_next_end = {
            [']K'] = { query = '@block.outer', desc = 'Next block end' },
            [']M'] = { query = '@function.outer', desc = 'Next function end' },
            [']A'] = { query = '@parameter.inner', desc = 'Next argument end' },
            [']C'] = { query = '@class.outer', desc = 'Next class end' },
            [']F'] = { query = '@call.outer', desc = 'Next function call end' },
            [']I'] = { query = '@conditional.outer', desc = 'Next conditional end' },
            [']L'] = { query = '@loop.outer', desc = 'Next loop end' },
          },
          goto_previous_start = {
            ['[k'] = { query = '@block.outer', desc = 'Previous block start' },
            ['[m'] = { query = '@function.outer', desc = 'Previous function start' },
            ['[a'] = { query = '@parameter.inner', desc = 'Previous argument start' },
            ['[c'] = { query = '@class.outer', desc = 'Previous class start' },
            ['[f'] = { query = '@call.outer', desc = 'Prev function call start' },
            ['[i'] = { query = '@conditional.outer', desc = 'Prev conditional start' },
            ['[l'] = { query = '@loop.outer', desc = 'Prev loop start' },
          },
          goto_previous_end = {
            ['[K'] = { query = '@block.outer', desc = 'Previous block end' },
            ['[M'] = { query = '@function.outer', desc = 'Previous function end' },
            ['[A'] = { query = '@parameter.inner', desc = 'Previous argument end' },
            ['[C'] = { query = '@class.outer', desc = 'Previous class end' },
            ['[F'] = { query = '@call.outer', desc = 'Prev function call end' },
            ['[I'] = { query = '@conditional.outer', desc = 'Prev conditional end' },
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
      },
    }
    vim.keymap.set('n', 'gs', function()
      require('treesitter-context').go_to_context(vim.v.count1)
    end, { desc= 'Go to context', silent = true })
  end, 0),
}
