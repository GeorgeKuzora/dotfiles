return {
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    name = 'lualine',
    opts = {
      options = {
        icons_enabled = true,
        theme = 'kanagawa',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
}
