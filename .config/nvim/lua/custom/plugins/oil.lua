return {
  'stevearc/oil.nvim',
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
  config = function()
    require('oil').setup { keymaps = {
      ['<C-l>'] = false,
      ['gl'] = 'actions.refresh',
    } }
    local o = require 'oil'

    vim.keymap.set('n', '-', function()
      o.open()
    end, { desc = 'Oil open parent directory' })
  end,
}
