return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
  config = function()
    local km = vim.keymap
    local trouble = require 'trouble'
    km.set('n', '<leader>xx', function()
      trouble.toggle()
    end, { desc = 'Trouble toggle' })
    km.set('n', '<leader>xw', function()
      trouble.toggle 'workspace_diagnostics'
    end, { desc = 'Trouble Workspace diagnostics' })
    km.set('n', '<leader>xd', function()
      trouble.toggle 'document_diagnostics'
    end, { desc = 'Trouble Document diagnostics' })
    km.set('n', '<leader>xq', function()
      trouble.toggle 'quickfix'
    end, { desc = 'Trouble quickfix list' })
    km.set('n', '<leader>xl', function()
      trouble.toggle 'loclist'
    end, { desc = 'Trouble Location List' })
    km.set('n', '<leader>xr', function()
      trouble.toggle 'lsp_references'
    end, { desc = 'Trouble LSP References' })
    km.set('n', '<leader>xt', function()
      trouble.toggle 'lsp_type_definitions'
    end, { desc = 'Trouble LSP Type Definitions' })
  end,
}
