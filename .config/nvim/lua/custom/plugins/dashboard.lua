return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      config = {
        week_header = {
          enable = true, --boolean use a week header
        },
      },
      hide = {
        statusline = true, -- hide statusline default is true
        tabline = true, -- hide the tabline
        winbar = true, -- hide winbar
      },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
