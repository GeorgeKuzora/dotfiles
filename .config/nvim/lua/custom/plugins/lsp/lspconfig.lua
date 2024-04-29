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
    'hrsh7th/cmp-nvim-lsp',
  },

  -- KEYMAPS

  config = function()
    local on_attach = function(_, bufnr)
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      nmap('<leader>lx', ':LspRestart<CR>', 'Restart LSP')

      nmap('<leader>lr', vim.lsp.buf.rename, '[R]ename')
      nmap('<leader>la', vim.lsp.buf.code_action, 'Code [A]ction')

      nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
      nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
      nmap('gy', require('telescope.builtin').lsp_type_definitions, '[G]oto t[Y]pe definition')
      nmap('<leader>ls', require('telescope.builtin').lsp_document_symbols, '[L]sp Document [S]ymbols')
      nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Lsp [W]orkspace [S]ymbols')

      -- See `:help K` for why this keymap
      nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      nmap('<A-K>', vim.lsp.buf.signature_help, 'Signature Documentation')
      vim.keymap.set('i', '<A-k>', function()
        vim.lsp.buf.hover()
      end, { desc = 'Hover documentation' })
      vim.keymap.set('i', '<A-K>', function()
        vim.lsp.buf.signature_help()
      end, { desc = 'Hover signature' })

      -- Lesser used LSP functionality
      nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
      nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
      nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, '[W]orkspace [L]ist Folders')

      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })

      nmap('<leader>lv', function()
        vim.lsp.buf.format { async = false }
      end, '[F]ormat buffer with lsp')

      if vim.lsp.inlay_hint then
        nmap('<leader>lh', function()
          vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled(0))
          if vim.lsp.inlay_hint.is_enabled(0) then
            print 'Inlay hints enabled'
          else
            print 'Inlay hints disabled'
          end
        end, 'Toggle Inlay Hints')
      end
    end

    -- LSP SETUP

    require('neodev').setup()
    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    -- LSP SERVERS

    local servers = {
      gopls = {
        settings = {
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
      },
      pyright = {},
      tsserver = {
        settings = {
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
        'stylua', -- lua formatter
        'isort', -- python formatter
        'black', -- python formatter
        'prettier',
        -- linters
        'flake8',
        'stylelint',
        'markdownlint',
        'eslint_d',
        -- debuggers
        'debugpy',
      },
    }

    -- Ensure the servers above are installed
    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
      automatic_installation = true, -- not the same as ensure_installed
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end,
    }
  end,
}
