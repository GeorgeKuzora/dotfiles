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
      pyright = {
        python = {
          analysis = {
            -- autoSearchPaths = true,
            -- diagnosticMode = "openFilesOnly",
            -- useLibraryCodeForTypes = true,
          },
        },
      },
      pyrefly = {
        cmd = { 'pyrefly', 'lsp' }
      },
      ts_ls = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = 'all',
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = 'all',
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
      },
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
    -- KEYBINDINGS

    local on_attach = function(_, bufnr)
      local nmap = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })

      nmap('grn', vim.lsp.buf.rename, 'Rename symbol')
      nmap('gra', vim.lsp.buf.code_action, 'Code action')
      nmap('<leader>lv', function()
        vim.lsp.buf.format { async = false }
      end, 'Format buffer with LSP')
      if vim.lsp.inlay_hint then
        nmap('<leader>uh', function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(nil))
          if vim.lsp.inlay_hint.is_enabled(nil) then
            print 'Inlay hints enabled'
          else
            print 'Inlay hints disabled'
          end
        end, 'Toggle inlay hints')
      end

      --
      nmap('<C-s>', function() vim.lsp.buf.signature_help() end, 'Signature help')

      vim.keymap.set({ 'i', 'v', 'x' }, '<C-s>', function()
        vim.lsp.buf.signature_help()
      end, { desc = 'Signature help' })

      vim.keymap.set({ 'i', 'v', 'x' }, '<C-k>', function()
        vim.lsp.buf.hover()
      end, { desc = 'Hover documentation' })
      --


      nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, 'Add workspace folder')
      nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Remove workspace folder')
      nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, 'List workspace folders')
    end

    -- CAPABILITIES

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities({}, false))

    capabilities = vim.tbl_deep_extend('force', capabilities, {
      textDocument = {
        foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true
        }
      }
    })

    -- MASON CONFIG

    local mason = require 'mason'
    local mason_tool_installer = require 'mason-tool-installer'

    mason.setup {
      PATH = "append",
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    }

    mason_tool_installer.setup {
      ensure_installed = {
        -- formatters
        'isort',
        'prettier',
        -- linters
        'stylelint',
        'markdownlint',
        'eslint_d',
        -- debuggers
        'debugpy',
      },
    }

    -- LSP CONFIG

    local setup_servers = function(server_name, server_opts)
      require('lspconfig')[server_name].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = server_opts,
        filetypes = (server_opts or {}).filetypes,
      }
    end

    for server_name, server_opts in pairs(opts.servers) do
      setup_servers(server_name, server_opts)
    end

    -- Not supported by lsp.config
    vim.lsp.enable({ "pyrefly" })
  end,
}
