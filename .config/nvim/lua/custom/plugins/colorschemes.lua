return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
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
                enabled = true, -- dims the background color of inactive window
                shade = "dark",
                percentage = 0.15, -- percentage of the shade to apply to the inactive window
            },
        integrations = {
          ts_rainbow2 = true,
            }
      })
      -- vim.cmd.colorscheme 'catppuccin'
    end,
  },

  {
    'rebelot/kanagawa.nvim',
    name = 'kanagawa',
    priority = 1000,
    opts = {},
    config = function()
      require("kanagawa").setup({
        compile = false,             -- enable compiling the colorscheme
        undercurl = true,            -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true},
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,         -- do not set background color
        dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
        terminalColors = true,       -- define vim.g.terminal_color_{0,17}
        colors = {                   -- add/modify theme and palette colors
              palette = {},
              theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
          },
        overrides = function(colors) -- add/modify highlights
              local palette = colors.palette
              return {
                   RainbowDelimiterRed = {default = true, fg = palette.waveRed, ctermfg= 'Red' },
	               RainbowDelimiterOrange = {default = true, fg = palette.surimiOrange, ctermfg= 'White' },
	               RainbowDelimiterYellow = {default = true, fg = palette.boatYellow2, ctermfg= 'Yellow' },
	               RainbowDelimiterGreen = {default = true, fg = palette.springGreen, ctermfg= 'Green' },
	               RainbowDelimiterCyan = {default = true, fg = palette.springBlue, ctermfg= 'Cyan' },
	               RainbowDelimiterBlue = {default = true, fg = palette.crystalBlue, ctermfg= 'Blue' },
	               RainbowDelimiterViolet = {default = true, fg = palette.oniViolet, ctermfg= 'Magenta' },
          }
        end,
        theme = "wave",              -- Load "wave" theme when 'background' option is not set
        background = {               -- map the value of 'background' option to a theme
              dark = "wave",           -- try "dragon" !
              light = "lotus"
          },
      })
      vim.cmd.colorscheme 'kanagawa'
    end,
  },
}
