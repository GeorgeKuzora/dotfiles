vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  {
    src = "https://github.com/ThePrimeagen/harpoon",
    version = 'harpoon2',
  }
})

local harpoon = require 'harpoon'
harpoon:setup()
Map('n', '<leader>i', function()
  harpoon:list():add()
end, { desc = 'Harpoon add mark' })
Map('n', '<leader>j', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'Toggle Harpoon' })
Map('n', '<C-1>', function()
  harpoon:list():select(1)
end, { desc = 'Harpoon mark 1' })
Map('n', '<C-2>', function()
  harpoon:list():select(2)
end, { desc = 'Harpoon mark 2' })
Map('n', '<C-3>', function()
  harpoon:list():select(3)
end, { desc = 'Harpoon mark 3' })
Map('n', '<C-4>', function()
  harpoon:list():select(4)
end, { desc = 'Harpoon mark 4' })
Map('n', '<C-5>', function()
  harpoon:list():select(5)
end, { desc = 'Harpoon mark 5' })
Map('n', ']n', function()
  harpoon:list():next()
end, { desc = 'Next Harpoon mark' })
Map('n', '[n', function()
  harpoon:list():prev()
end, { desc = 'Previous Harpoon mark' })
