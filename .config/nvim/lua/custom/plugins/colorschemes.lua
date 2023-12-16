return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {     -- :h background
          light = "latte",
          dark = "mocha",
        },
        dim_inactive = {
          enabled = true,    -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        color_overrides = {
          mocha = {
            base = "#11111b",
            mantle = "#08080d",
            crust = "#08080d",
          },
        },
        integrations = {
          aerial = true,
          harpoon = true,
          mason = true,
          neotree = true,
          treesitter_context = true,
          which_key = true,
        }
      })
      vim.cmd.colorscheme 'catppuccin'
    end,
  },

  -- {
  --   'GeorgeKuzora/night-owl.nvim',
  --   name = 'night-owl',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     require("night-owl").setup()
  --     -- vim.cmd.colorscheme 'night-owl'
  --   end,
  -- },
  --
  -- {
  --   "folke/tokyonight.nvim",
  --   name = 'tokyonight',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     require("tokyonight").setup({
  --       style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  --       light_style = "day",
  --       dim_inactive = true,
  --     })
  --     -- vim.cmd.colorscheme 'tokyonight'
  --   end,
  -- },
  --
  -- {
  --   "EdenEast/nightfox.nvim",
  --   name = 'nightfox',
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     require('nightfox').setup({
  --       options = {
  --         dim_inactive = true,
  --       }
  --     })
  --     -- vim.cmd.colorscheme 'nightfox'
  --   end
  -- },
  --
  -- {
  --   'rose-pine/neovim',
  --   name = 'rose-pine',
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     -- vim.cmd('colorscheme rose-pine')
  --   end
  -- },
  --
  -- {
  --   'rebelot/kanagawa.nvim',
  --   name = 'kanagawa',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     require("kanagawa").setup({
  -- compile = false,  -- enable compiling the colorscheme
  -- undercurl = true, -- enable undercurls
  -- commentStyle = { italic = true },
  -- functionStyle = {},
  -- keywordStyle = { italic = true },
  -- statementStyle = { bold = true },
  -- typeStyle = {},
  -- transparent = false,   -- do not set background color
  -- dimInactive = true,    -- dim inactive window `:h hl-NormalNC`
  -- terminalColors = true, -- define vim.g.terminal_color_{0,17}
  -- colors = {             -- add/modify theme and palette colors
  --   palette = {},
  --   theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
  -- },
  -- overrides = function(colors) -- add/modify highlights
  --   local palette = colors.palette
  --   return {
  --     RainbowDelimiterRed = { default = true, fg = palette.waveRed, ctermfg = 'Red' },
  --     RainbowDelimiterOrange = { default = true, fg = palette.surimiOrange, ctermfg = 'White' },
  --     RainbowDelimiterYellow = { default = true, fg = palette.boatYellow2, ctermfg = 'Yellow' },
  --     RainbowDelimiterGreen = { default = true, fg = palette.springGreen, ctermfg = 'Green' },
  --     RainbowDelimiterCyan = { default = true, fg = palette.springBlue, ctermfg = 'Cyan' },
  --     RainbowDelimiterBlue = { default = true, fg = palette.crystalBlue, ctermfg = 'Blue' },
  --     RainbowDelimiterViolet = { default = true, fg = palette.oniViolet, ctermfg = 'Magenta' },
  --   }
  -- end,
  -- theme = "wave",  -- Load "wave" theme when 'background' option is not set
  -- background = {   -- map the value of 'background' option to a theme
  --   dark = "wave", -- try "dragon" !
  --   light = "lotus"
  -- },
  -- })
  -- vim.cmd("colorscheme kanagawa")
  --   end,
  -- },

  -- {
  --   "craftzdog/solarized-osaka.nvim",
  --   name = "solarized-osaka",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     require("solarized-osaka").setup({
  --       -- your configuration comes here
  --       -- or leave it empty to use the default settings
  --       style = "night",
  --       transparent = false,    -- Enable this to disable setting the background color
  --       terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
  --       styles = {
  --         -- Style to be applied to different syntax groups
  --         -- Value is any valid attr-list value for `:help nvim_set_hl`
  --         comments = { italic = true },
  --         keywords = { italic = true },
  --         functions = {},
  --         variables = {},
  --         -- Background styles. Can be "dark", "transparent" or "normal"
  --         sidebars = "dark",              -- style for sidebars, see below
  --         floats = "dark",                -- style for floating windows
  --       },
  --       sidebars = { "qf", "help" },      -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  --       day_brightness = 0.3,             -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  --       hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  --       dim_inactive = true,              -- dims inactive windows
  --       lualine_bold = false,             -- When `true`, section headers in the lualine theme will be bold
  --
  --       --- You can override specific color groups to use other groups or a hex color
  --       --- function will be called with a ColorScheme table
  --       ---@param colors ColorScheme
  --       on_colors = function(colors) end,
  --
  --       --- You can override specific highlights to use other groups or a hex color
  --       --- function will be called with a Highlights and ColorScheme table
  --       ---@param highlights Highlights
  --       ---@param colors ColorScheme
  --       on_highlights = function(highlights, colors) end,
  --     })
  --     -- vim.cmd.colorscheme 'solarized-osaka'
  --   end,
  -- },
  --
  -- {
  --   'navarasu/onedark.nvim',
  --   name = 'onedark',
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     require('onedark').setup {
  --       -- Main options --
  --       style = 'darker',             -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  --       transparent = false,          -- Show/hide background
  --       term_colors = true,           -- Change terminal color as per the selected theme style
  --       ending_tildes = false,        -- Show the end-of-buffer tildes. By default they are hidden
  --       cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
  --
  --       -- toggle theme style ---
  --       toggle_style_key = nil,                                                              -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
  --       toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between
  --
  --       -- Change code style ---
  --       -- Options are italic, bold, underline, none
  --       -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
  --       code_style = {
  --         comments = 'italic',
  --         keywords = 'none',
  --         functions = 'none',
  --         strings = 'none',
  --         variables = 'none'
  --       },
  --
  --       -- Lualine options --
  --       lualine = {
  --         transparent = false, -- lualine center bar transparency
  --       },
  --
  --       -- Custom Highlights --
  --       colors = {},     -- Override default colors
  --       highlights = {}, -- Override highlight groups
  --
  --       -- Plugins Config --
  --       diagnostics = {
  --         darker = true,     -- darker colors for diagnostic
  --         undercurl = true,  -- use undercurl instead of underline for diagnostics
  --         background = true, -- use background color for virtual text
  --       },
  --     }
  --     -- vim.cmd.colorscheme 'onedark'
  --   end
  -- },
  --
}
