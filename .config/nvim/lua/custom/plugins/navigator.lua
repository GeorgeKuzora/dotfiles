return {
  'numToStr/Navigator.nvim',
  config = function()
    require('Navigator').setup()
    local navigator = require 'Navigator'
    vim.keymap.set({ 'n', 't' }, '<C-h>', function()
      navigator.left()
    end)
    vim.keymap.set({ 'n', 't' }, '<C-l>', function()
      navigator.right()
    end)
    vim.keymap.set({ 'n', 't' }, '<C-k>', function()
      navigator.up()
    end)
    vim.keymap.set({ 'n', 't' }, '<C-j>', function()
      navigator.down()
    end)
    vim.keymap.set({ 'n', 't' }, '<C-[>', function()
      navigator.previous()
    end)
  end,
}
