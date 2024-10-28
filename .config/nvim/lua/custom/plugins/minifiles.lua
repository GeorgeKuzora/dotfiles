return {
  'echasnovski/mini.files',
  version = '*',
  config = function ()
    local m = require('mini.files')
    m.setup()
    vim.keymap.set('n', '<leader>-', function()
      m.open()
    end, { desc = 'Minifiles open' })
  end
}
