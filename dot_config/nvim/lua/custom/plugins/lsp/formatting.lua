return {
  'stevearc/conform.nvim',
  lazy = true,
  event = { 'BufReadPre', 'BufNewFile' }, -- to disable, comment this out
  config = function()
    local conform = require 'conform'

    local format_is_enabled = false
    vim.api.nvim_create_user_command('FormatOnSaveToggle', function()
      format_is_enabled = not format_is_enabled
      print('Setting autoformatting to: ' .. tostring(format_is_enabled))
    end, {})


    local python_formatters = {}

    if vim.fn.executable('black') == 1 then
      table.insert(python_formatters, 'black')
    end
    if vim.fn.executable('isort') == 1 then
      table.insert(python_formatters, 'isort')
    end
    if vim.fn.executable('ruff') == 1 then
      table.insert(python_formatters, 'ruff_format')
    end

    conform.setup {
      formatters_by_ft = {
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        svelte = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        graphql = { 'prettier' },
        lua = { 'stylua' },
        python = python_formatters,
      },
      format_on_save = function()
        if not format_is_enabled then
          return
        end
        return {
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        }
      end,
    }

    vim.keymap.set('n', '<leader>lF', '<cmd>FormatOnSaveToggle<CR>', { desc = 'Toggle format on save' })
    vim.keymap.set({ 'n', 'v' }, '<leader>lf', function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      }
    end, { desc = 'Format file or range (in visual mode)' })
  end,
}
