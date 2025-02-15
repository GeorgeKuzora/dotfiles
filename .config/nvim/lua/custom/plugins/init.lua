return {
  'onsails/lspkind.nvim',
  'tpope/vim-sleuth',
  'rafamadriz/friendly-snippets',
  'nvim-tree/nvim-web-devicons',
  'sindrets/diffview.nvim',
  {
    'stevearc/dressing.nvim',
    opts = {
      input = { default_prompt = '➤ ' },
      select = { backend = { 'telescope', 'builtin' } },
    },
  },
  {
    'j-hui/fidget.nvim',
    opts = {},
  },
  {
    'catgoose/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = {},
  },
}
