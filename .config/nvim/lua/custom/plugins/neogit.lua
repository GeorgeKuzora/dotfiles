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
      vim.keymap.set('n', '<leader>gg', neogit.open, { desc = 'Open Neogit' })
      vim.keymap.set('n', '<leader>gG', function()
        neogit.open { 'commit' }
      end, { desc = 'Open [N]eo[G]it commit dialog' })
      vim.keymap.set('n', '<leader>gd', '<cmd>DiffviewOpen<cr>', { desc = 'Open Diffview' })
      vim.keymap.set('n', '<leader>gk', '<cmd>DiffviewClose<cr>', { desc = 'Close Diffview' })
    end,
  },
}
