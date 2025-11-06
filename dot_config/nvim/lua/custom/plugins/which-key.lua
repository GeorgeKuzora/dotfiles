return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    preset = 'helix',
    delay = 1000,
    icons = { mappings = false },
    disable = { filetypes = { 'TelescopePrompt' } },
    spec = {
      { '<leader>[', group = 'Previous' },
      { '<leader>]', group = 'Next' },
      { '<leader>a', group = 'AI' },
      { '<leader>b', group = 'Buffers' },
      { '<leader>e', group = 'Explorer' },
      { '<leader>f', group = 'Find' },
      { '<leader>g', group = 'Git' },
      { '<leader>h', group = 'Git Hunk', mode = { 'n', 'v' } },
      { '<leader>l', group = 'LSP' },
      { '<leader>s', group = 'Surround' },
      { '<leader>t', group = 'Test' },
      { '<leader>w', group = 'Workspace' },
      { '<leader>r', group = 'Trouble' },
      { '<leader>u', group = 'UI' },
      { '<leader>x', group = 'Debug' },
    },
  },
  keys = {
    {
      '<leader>k',
      function()
        require('which-key').show { global = false }
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
}
