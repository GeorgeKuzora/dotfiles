return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'williamboman/mason.nvim',
      config = true,
      dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
      },
    },
    {
      'j-hui/fidget.nvim',
      opts = {},
    },
    'folke/neodev.nvim',
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
    local on_attach = function(_, bufnr)
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })

      nmap('<leader>lx', ':LspRestart<CR>', 'Restart LSP')
      nmap('<leader>gn', vim.lsp.buf.rename, 'Rename symbol')
      nmap('gra', vim.lsp.buf.code_action, 'Code action')
      nmap('<leader>lv', function()
        vim.lsp.buf.format { async = false }
      end, 'Format buffer with LSP')
      if vim.lsp.inlay_hint then
        nmap('<leader>lh', function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(nil))
          if vim.lsp.inlay_hint.is_enabled(nil) then
            print 'Inlay hints enabled'
          else
            print 'Inlay hints disabled'
          end
        end, 'Toggle inlay hints')
      end

      nmap('<A-K>', function() vim.lsp.buf.signature_help() end, 'Signature help')
      vim.keymap.set('i', '<A-k>', function()
        vim.lsp.buf.hover()
      end, { desc = 'Hover documentation' })
      vim.keymap.set('i', '<A-K>', function()
        vim.lsp.buf.signature_help()
      end, { desc = 'Signature help' })

      nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, 'Add workspace folder')
      nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Remove workspace folder')
      nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, 'List workspace folders')
    end

    -- LSP SETUP

    require('neodev').setup()

    vim.diagnostic.config {
      severity_sort = true,
      update_in_insert = false,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = ' ',
          [vim.diagnostic.severity.WARN] = ' ',
          [vim.diagnostic.severity.HINT] = '󰠠 ',
          [vim.diagnostic.severity.INFO] = ' ',
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
          [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
          [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
          [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
        },
        linehl = {
          [vim.diagnostic.severity.ERROR] = 'DiagnosticLineBackgroundError',
          [vim.diagnostic.severity.WARN] = 'DiagnosticLineBackgroundWarn',
          [vim.diagnostic.severity.HINT] = 'DiagnosticLineBackgroundHint',
          [vim.diagnostic.severity.INFO] = 'DiagnosticLineBackgroundInfo',
        },
      },
    }

    -- MASON CONFIG

    local mason = require 'mason'
    local mason_lspconfig = require 'mason-lspconfig'
    local mason_tool_installer = require 'mason-tool-installer'

    mason.setup {
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
        'stylua',
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

    -- Ensure the servers above are installed
    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(opts.servers),
      automatic_installation = true, -- not the same as ensure_installed
    }

    -- BLINK capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = opts.servers[server_name],
          filetypes = (opts.servers[server_name] or {}).filetypes,
        }
      end,
    }
  end,
}
