return {
  {
    'NeogitOrg/neogit',
    branch = 'master',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      local neogit = require 'neogit'
      neogit.setup()
      vim.keymap.set('n', '<leader>gg', neogit.open, { desc = 'Open [N]eo[G]it' })
      vim.keymap.set('n', '<leader>gG', function()
        neogit.open { 'commit' }
      end, { desc = 'Open [N]eo[G]it commit dialog' })
    end,
  },
}
