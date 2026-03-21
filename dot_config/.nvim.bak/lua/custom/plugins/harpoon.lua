return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  event = 'VeryLazy',
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()
    vim.keymap.set('n', '<leader>i', function()
      harpoon:list():add()
    end, { desc = 'Harpoon add mark' })
    vim.keymap.set('n', '<leader>j', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Toggle Harpoon' })
    vim.keymap.set('n', '<C-1>', function()
      harpoon:list():select(1)
    end, { desc = 'Harpoon mark 1' })
    vim.keymap.set('n', '<C-2>', function()
      harpoon:list():select(2)
    end, { desc = 'Harpoon mark 2' })
    vim.keymap.set('n', '<C-3>', function()
      harpoon:list():select(3)
    end, { desc = 'Harpoon mark 3' })
    vim.keymap.set('n', '<C-4>', function()
      harpoon:list():select(4)
    end, { desc = 'Harpoon mark 4' })
    vim.keymap.set('n', '<C-5>', function()
      harpoon:list():select(5)
    end, { desc = 'Harpoon mark 5' })
    vim.keymap.set('n', ']n', function()
      harpoon:list():next()
    end, { desc = 'Next Harpoon mark' })
    vim.keymap.set('n', '[n', function()
      harpoon:list():prev()
    end, { desc = 'Previous Harpoon mark' })
  end,
}
