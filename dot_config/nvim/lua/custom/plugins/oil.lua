return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
  config = function()
    local o = require 'oil'
    o.setup {
      keymaps = {
        ['<C-l>'] = false,
        ['gl'] = 'actions.refresh',
        ['q'] = { "actions.close", mode = "n" },
      },
      columns = { 'icon' },
      view_options = {
        show_hidden = true,
      },
    }

    vim.keymap.set('n', '-', function()
      o.open_float(nil)
    end, { desc = 'Oil open parent directory' })
  end,
}
