return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'j-hui/fidget.nvim',
      opts = {},
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
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities({}, false))

    vim.lsp.config('*', { capabilities = capabilities })

    for _, server_name in ipairs(opts.servers) do
      vim.lsp.enable(server_name, true)
    end
  end,
}
