return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'j-hui/fidget.nvim',
      opts = {},
    },
    {
      'folke/lazydev.nvim',
      ft = 'lua', -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        },
      },
    },
    'saghen/blink.cmp',
  },

  opts = {
    servers = {
      gopls = {
        gopls = {
          hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },
        },
      },
      -- rust_analyzer = {}, -- managed by rust plugin
      basedpyright = {
        python = {
          analysis = {
            diagnosticMode = "workspace",
            typeCheckingMode = "recommended",
            exclude = { "hidden*", ".venv" },
            allowedUntypedLibraries = { "mdw_tracing", "app.system.tracing" },
          },
        },
      },
      -- pyrefly = {
      --   cmd = { 'pyrefly', 'lsp' }
      -- },
      html = { filetypes = { 'html', 'twig', 'hbs' } },
      lua_ls = {
        Lua = {
          workspace = {
            checkThirdParty = false,
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand '$VIMRUNTIME/lua'] = true,
              [vim.fn.stdpath 'config' .. '/lua'] = true,
            },
          },
          telemetry = { enable = false },
          hint = { enable = true },
          diagnostics = { disable = { 'missing-fields' }, globals = { 'vim' } },
        },
      },
      emmet_ls = {},
      docker_compose_language_service = {},
      dockerls = {},
      marksman = {},
      unocss = {},
      typos_lsp = {},
    },
  },


  config = function(_, opts)
    -- CAPABILITIES

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities({}, false))

    -- LSP CONFIG

    local setup_servers = function(server_name, server_opts)
      vim.lsp.config( server_name, {
        capabilities = capabilities,
        settings = server_opts,
        filetypes = (server_opts or {}).filetypes,
      })
      vim.lsp.enable({ server_name })
    end

    for server_name, server_opts in pairs(opts.servers) do
      setup_servers(server_name, server_opts)
    end
  end,
}
