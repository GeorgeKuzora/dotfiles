-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',



  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
  },
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      -- signs = {
      --   add = { text = "▎" },
      --   change = { text = "▎" },
      --   delete = { text = "▎" },
      --   topdelete = { text = "契" },
      --   changedelete = { text = "▎" },
      --   untracked = { text = "▎" },
      -- },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
          { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
        vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
      end,
    },
  },

  {
    -- Theme inspired by Atom
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = {     -- :h background
        light = "latte",
        dark = "mocha",
      },
    },
    config = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- for better escaping sequencies
  {
    "max397574/better-escape.nvim",
    event = "InsertCharPre",
    opts = {
      timeout = 300,
      mapping = { "ii", "шш" },
      clear_empty_lines = false, -- clear line after escaping if there is only whitespace
      keys = function()
        return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
      end -- keys used for escaping, if it is a function will use the result everytime
    },
  },
  -- New surround movements
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },

  -- raindow parenticis
  {
    "HiPhish/nvim-ts-rainbow2",
    event = "BufRead",
    config = function()
      require('nvim-treesitter.configs').setup {
        rainbow = {
          enable = true,
          -- list of languages you want to disable the plugin for
          -- disable = { 'jsx', 'cpp' },
          -- Which query to use for finding delimiters
          query = 'rainbow-parens',
          -- Highlight the entire buffer all at once
          strategy = require('ts-rainbow').strategy.global,
        }
      }
    end,
  },
  -- remove trailing spaces
  -- {
  --   "thirtythreeforty/lessspace.vim",
  --   event = "BufRead",
  -- },
  -- undotree
  {
    "mbbill/undotree",
    event = "VeryLazy",
    -- mappings = {
    --   n = {
    --   [userleader .. "u"] = { "<cmd>UndotreeToggle<CR>", desc = "Toggle Undo-tree" },
    --   },
    -- },
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {
      check_ts = true,
      ts_config = { java = false },
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0,
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
      },
    } -- this is equalent to setup({}) function
  },
  {
    'folke/trouble.nvim',
    event = "VeryLazy",
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = "BufRead",
  },
}
