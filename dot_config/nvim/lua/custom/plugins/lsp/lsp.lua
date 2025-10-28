return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'williamboman/mason.nvim',
      config = true,
      dependencies = {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
      },
    },
    {
      'j-hui/fidget.nvim',
      opts = {},
    },
    {
      'folke/lazydev.nvim',
      ft = 'lua',
      opts = {
        library = {
          { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        },
      },
    },
    'saghen/blink.cmp',
  },

  opts = {
    servers = {
      'basedpyright',
      'gopls',
      'rust_analyzer',
      'html',
      'lua_ls',
      'docker_compose_language_service',
      'dockerls',
      'marksman',
      'typos_lsp',
    },
  },


  config = function(_, opts)

    -- MASON CONFIG

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

    -- LSP CONFIG

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities({}, false))
    vim.lsp.config('*', { capabilities = capabilities })

    for _, server_name in ipairs(opts.servers) do
      vim.lsp.enable(server_name, true)
    end
  end,
}
