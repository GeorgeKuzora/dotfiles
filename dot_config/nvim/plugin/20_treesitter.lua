vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
})

local filetypes = {
  'bash',
  'c',
  'css',
  'diff',
  'fish',
  'go',
  'html',
  'javascript',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'python',
  'query',
  'regex',
  'rust',
  'sql',
  'toml',
  'vim',
  'vimdoc',
  'yaml',
}

require('nvim-treesitter').setup {
  install_dir = vim.fn.stdpath('data') .. '/site'
}

require('nvim-treesitter').install(filetypes)

vim.api.nvim_create_autocmd('FileType', {
  group = AutocmdGroup 'treesitter_start',
  pattern = filetypes,
  callback = function()
    vim.treesitter.start()
  end
})
