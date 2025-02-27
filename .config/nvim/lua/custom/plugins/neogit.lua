return {
  {
    'NeogitOrg/neogit',
    branch = 'master',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
    },
    config = function()
      local neogit = require 'neogit'
      neogit.setup {}
      vim.keymap.set('n', '<leader>gg', neogit.open, { desc = 'Open Neogit' })
      vim.keymap.set('n', '<leader>gG', function()
        neogit.open { 'commit' }
      end, { desc = 'Open [N]eo[G]it commit dialog' })
    end,
  },
}
