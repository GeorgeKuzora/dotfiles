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

    local configs = {
      { lang = 'python', name = 'black', path = './.venv/bin/black' },
      { lang = 'python', name = 'isort', path = './.venv/bin/isort' },
      { lang = 'python', name = 'ruff_format', path = './.venv/bin/ruff' },
      { lang = 'rust', name = 'rustfmt', path = 'rustfmt' },
      { lang = 'go', name = 'gofmt', path = 'gofmt' }
    }

    local formatters = {}

    for _, config in ipairs(configs) do
      if not formatters[config.lang] then
        formatters[config.lang] = {}
      end
      if vim.fn.executable(config.path) == 1 then
        table.insert(formatters[config.lang], config.name)
      end
    end

    conform.setup {
      formatters_by_ft = formatters,
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
    end, { desc = 'Format file or range' })
  end,
}
