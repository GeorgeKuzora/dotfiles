return {
  'williamboman/mason.nvim',
  dependencies = {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },

  config = function()
    require('mason').setup {
      PATH = "append",
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    }
    require('mason-tool-installer').setup {
      ensure_installed = {
        -- formatters
        'isort',
        -- linters
        'stylelint',
        'markdownlint',
      },
    }
  end,
}
