return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
    opts = {
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = 'latte',
        dark = 'mocha',
      },
      dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = 'dark',
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { 'italic' }, -- Change the style of comments
        conditionals = {},
        loops = {},
        functions = { 'italic' },
        keywords = { 'italic' },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = { 'italic' },
        operators = {},
      },
      color_overrides = {
        mocha = {
          base = '#181825',
          mantle = '#11111b',
          crust = '#11111b',
        },
      },
      integrations = {
        alpha = true,
        blink_cmp = true,
        diffview = true,
        dropbar = {
          enabled = true,
          color_mode = true, -- enable color for kind's texts, not just kind's icons
        },
        fidget = true,
        gitsigns = true,
        grug_far = true,
        harpoon = true,
        indent_blankline = {
          enabled = true,
        },
        lsp_trouble = true,
        mason = true,
        mini = {
          enabled = true,
        },
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { 'undercurl' },
            hints = { 'undercurl' },
            warnings = { 'undercurl' },
            information = { 'undercurl' },
          },
        },
        neogit = true,
        neotest = true,
        nvim_surround = true,
        notify = true,
        semantic_tokens = true,
        snacks = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
      custom_highlights = function(colors)
        return {
          DiagnosticLineBackgroundError = { bg = '#2D2331' },
          DiagnosticLineBackgroundWarn = { bg = '#2D2B32' },
          DiagnosticLineBackgroundInfo = { bg = '#242B36' },
          DiagnosticLineBackgroundHint = { bg = '#242B36' },
          DiagnosticSignError = { bg = '#2D2331' },
          DiagnosticSignWarn = { bg = '#2D2B32' },
          DiagnosticSignInfo = { bg = '#242B36' },
          DiagnosticSignHint = { bg = '#242B36' },
          SnacksIndentScope = { fg = colors.overlay0 },
          SnacksIndent = { fg = colors.surface0 },
        }
      end,
    },
  },
}
