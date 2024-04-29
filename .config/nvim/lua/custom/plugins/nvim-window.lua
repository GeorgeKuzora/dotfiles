return {
  'https://gitlab.com/yorickpeterse/nvim-window.git',
  opts = {},
  config = function()
    require('nvim-window').setup {}
    vim.keymap.set('n', '<C-w>w', function()
      require('nvim-window').pick()
    end, { desc = 'Pick a window' })
  end,
}
