return {
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      local neogit = require 'neogit'
      neogit.setup()
      vim.keymap.set('n', '<leader>gg', neogit.open, { desc = 'Open Neo[G]it' })
      vim.keymap.set('n', '<leader>gG', function()
        neogit.open { 'commit' }
      end, { desc = 'Open Neo[G]it commit dialog' })
    end,
  },
}
