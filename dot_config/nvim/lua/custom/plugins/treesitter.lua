return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
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

    require('nvim-treesitter').install(filetypes)

    vim.api.nvim_create_autocmd('FileType', {
      group = AutocmdGroup 'treesitter_start',
      pattern = filetypes,
      callback = function()
        vim.treesitter.start()
      end
    })
  end
}
