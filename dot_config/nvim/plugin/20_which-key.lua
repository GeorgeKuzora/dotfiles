vim.pack.add({
  "https://github.com/folke/which-key.nvim",
})

local wk = require("which-key")

wk.setup({
  preset = 'helix',
  delay = 1000,
  icons = { mappings = false },
  disable = { filetypes = { 'TelescopePrompt' } },
  spec = {
    { '<leader>', group = 'Custom' },
    { '<leader>[', group = 'Previous' },
    { '<leader>]', group = 'Next' },
    { '<leader>t', group = 'Tabs' },
    { '<leader>b', group = 'Buffers' },
    { '<leader>f', group = 'Find' },
    { '<leader>g', group = 'Git' },
    { '<leader>h', group = 'Git Hunk', mode = { 'n', 'v' } },
    { '<leader>k', group = 'LSP' },
    { '<leader>o', group = 'Test' },
    { '<leader>w', group = 'Workspace' },
    { '<leader>u', group = 'UI' },
    { '<leader>x', group = 'Debug' },
    { '<leader>xB', group = 'Breakpoints' },
  },
})

-- KEYMAPS
Map( { 'n' }, '<leader>y', function() wk.show { global = false } end, {desc = 'Buffer Local Keymaps (which-key)'})
