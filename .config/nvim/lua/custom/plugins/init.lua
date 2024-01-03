return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gg', vim.cmd.Git, { desc = 'Git fugitive status' })
    end,
  },

  'tpope/vim-rhubarb',

  'nvim-treesitter/nvim-treesitter-context',

  'onsails/lspkind.nvim',

  'tpope/vim-sleuth',

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      require('ibl').setup {
        indent = { char = '┊' },
        scope = {
          enabled = false,
          show_start = false,
          show_end = false,
        },
      }
    end,
  },

  {
    'echasnovski/mini.indentscope',
    version = false,
    config = function()
      require('mini.indentscope').setup {
        mappings = {
          -- Textobjects
          object_scope = 'in',
          object_scope_with_border = 'an',

          -- Motions (jump to respective border line; if not present - body line)
          goto_top = '[n',
          goto_bottom = ']n',
        },
        symbol = '┊',
      }
    end,
  },

  {
    'numToStr/Comment.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    opts = {},
    config = function()
      -- import comment plugin safely
      local comment = require 'Comment'

      local ts_context_commentstring = require 'ts_context_commentstring.integrations.comment_nvim'

      -- enable comment
      comment.setup {
        -- for commenting tsx and jsx files
        pre_hook = ts_context_commentstring.create_pre_hook(),
      }
    end,
  },

  {
    'max397574/better-escape.nvim',
    lazy = true,
    event = 'InsertCharPre',
    opts = {
      timeout = 300,
      mapping = { 'ii', 'шш' },
      clear_empty_lines = false, -- clear line after escaping if there is only whitespace
      keys = function()
        return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
      end, -- keys used for escaping, if it is a function will use the result everytime
    },
  },

  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {}
    end,
  },

  {
    'hiphish/rainbow-delimiters.nvim',
    name = 'rainbow_delimiters',
    config = function()
      local rainbow_delimiters = require 'rainbow-delimiters'

      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      }
    end,
  },

  {
    'mbbill/undotree',
    event = 'VeryLazy',
    config = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle [U]ndo-tree' })
    end,
  },

  {
    'NvChad/nvim-colorizer.lua',
    event = { 'BufReadPre', 'BufNewFile' },
    cmd = { 'ColorizerToggle', 'ColorizerAttachToBuffer', 'ColorizerDetachFromBuffer', 'ColorizerReloadAllBuffers' },
    opts = { user_default_options = { names = false } },
    config = true,
  },

  {
    'rafamadriz/friendly-snippets',
    name = 'friendly-snippets',
  },

  {
    'nvim-tree/nvim-web-devicons',
    config = true,
  },

  {
    'declancm/maximize.nvim',
    config = function()
      require('maximize').setup()
    end,
  },

  {
    'https://gitlab.com/yorickpeterse/nvim-window.git',
    opts = {},
  },
}
