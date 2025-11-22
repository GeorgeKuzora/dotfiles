return {
  'stevearc/oil.nvim',
  opts = {},
  config = function()
    local o = require 'oil'
    o.setup {
      keymaps = {
        ['<C-l>'] = false,
        ['gl'] = 'actions.refresh',
        ['q'] = { "actions.close", mode = "n" },
      },
      columns = {},
      view_options = {
        show_hidden = true,
      },
      cleanup_delay_ms = 0,
    }

    vim.keymap.set('n', '-', function()
      o.open(nil)
    end, { desc = 'Oil open parent directory' })
  end,
}
