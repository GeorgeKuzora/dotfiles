-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  {
    'tpope/vim-fugitive',
    config = function ()
      vim.keymap.set('n', '<leader>gg', vim.cmd.Git, { desc = "Git fugitive status" })
    end
  },
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',




  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup {
        indent = { char = "┊", },
        scope = {
          enabled = true,
          show_start = false,
          show_end = false,
        },
      }
    end
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- for better escaping sequencies
  {
    "max397574/better-escape.nvim",
    lazy = true,
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

  -- remove trailing spaces
  -- {
  --   "thirtythreeforty/lessspace.vim",
  --   event = "BufRead",
  -- },
  -- undotree
  {
    "mbbill/undotree",
    event = "VeryLazy",
    config = function ()
      vim.keymap.set('n', "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle [U]ndo-tree" })
    end
  },
  {
    'windwp/nvim-autopairs',
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
  },
  {
    'ThePrimeagen/harpoon',
    event = "VeryLazy",
    config = function()
      -- HARPOON
      -- km.set('n', "<c-s>", '<cmd>lua vim.lsp.buf.signature_help()<CR>', { desc = "Hover signature" })
      vim.keymap.set('n', "<leader>y", function() require("harpoon.mark").add_file() end, { desc = "Harpoon add mark" })
      vim.keymap.set('n', "<leader>j", function() require("harpoon.ui").toggle_quick_menu() end, { desc = "Toggle Harpoon" })
      vim.keymap.set('n', "]h", function() require("harpoon.ui").nav_next() end, { desc = "Next Harpoon mark" })
      vim.keymap.set('n', "[h", function() require("harpoon.ui").nav_prev() end, { desc = "Previous Harpoon mark" })
      vim.keymap.set('n', "<M-u>", function() require("harpoon.ui").nav_file(1) end, { desc = "Harpoon mark 1" })
      vim.keymap.set('n', "<M-i>", function() require("harpoon.ui").nav_file(2) end, { desc = "Harpoon mark 2" })
      vim.keymap.set('n', "<M-o>", function() require("harpoon.ui").nav_file(3) end, { desc = "Harpoon mark 3" })
      vim.keymap.set('n', "<M-p>", function() require("harpoon.ui").nav_file(4) end, { desc = "Harpoon mark 4" })
    end
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufRead",
    cmd = { "ColorizerToggle", "ColorizerAttachToBuffer", "ColorizerDetachFromBuffer", "ColorizerReloadAllBuffers" },
    opts = { user_default_options = { names = false } },
  },
  {
    "rafamadriz/friendly-snippets",
    name = "friendly-snippets"
  },
  {
    'onsails/lspkind.nvim',
  },
}
