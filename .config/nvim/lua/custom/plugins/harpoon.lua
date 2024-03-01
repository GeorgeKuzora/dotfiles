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
    -- HARPOON
    -- km.set('n', "<c-s>", '<cmd>lua vim.lsp.buf.signature_help()<CR>', { desc = "Hover signature" })
    vim.keymap.set('n', '<leader>i', function()
      harpoon:list():append()
    end, { desc = 'Harpoon add mark' })
    vim.keymap.set('n', '<leader>j', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Toggle Harpoon' })
    vim.keymap.set('n', '<leader-1>', function()
      harpoon:list():select(1)
    end, { desc = 'Harpoon mark 1' })
    vim.keymap.set('n', '<leader-2>', function()
      harpoon:list():select(2)
    end, { desc = 'Harpoon mark 2' })
    vim.keymap.set('n', '<leader-3>', function()
      harpoon:list():select(3)
    end, { desc = 'Harpoon mark 3' })
    vim.keymap.set('n', '<leader-4>', function()
      harpoon:list():select(4)
    end, { desc = 'Harpoon mark 4' })
    vim.keymap.set('n', ']h', function()
      harpoon:list():next()
    end, { desc = 'Next Harpoon mark' })
    vim.keymap.set('n', '[h', function()
      harpoon:list():prev()
    end, { desc = 'Previous Harpoon mark' })
  end,
}
