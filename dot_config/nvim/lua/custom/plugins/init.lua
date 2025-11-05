return {
  'neovim/nvim-lspconfig',
  'onsails/lspkind.nvim',
  'tpope/vim-sleuth',
  'rafamadriz/friendly-snippets',
  'nvim-tree/nvim-web-devicons',
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
}
