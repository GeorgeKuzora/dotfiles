return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {
      filters = {
        dotfiles = true,
      },
      view = {
        side = 'right',
      },
    }
    vim.keymap.set('n', '<leader>ee', '<cmd>NvimTreeFindFile<cr>', { desc = 'Nvim-tree open on file' })
    vim.keymap.set('n', '<leader>et', '<cmd>NvimTreeToggle<cr>', { desc = 'Nvim-tree toggle' })
    vim.keymap.set('n', '<leader>ef', '<cmd>NvimTreeFocus<cr>', { desc = 'Nvim-tree focus' })
  end,
}
