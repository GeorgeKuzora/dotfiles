return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      statuscolumn = { enabled = true },
      lazygit = { enabled = true },
    },
    keys = {
      { '<leader>gl', function () Snacks.lazygit.open() end, desc = 'LazyGit' },
    },
  },
}
