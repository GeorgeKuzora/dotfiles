return {
  'mfussenegger/nvim-lint',
  lazy = true,
  event = { 'BufReadPre', 'BufNewFile' }, -- to disable, comment this out
  config = function()
    local lint = require 'lint'

    local tools = {
      { lang = 'python', name = 'flake8', path = './.venv/bin/flake8' },
      { lang = 'python', name = 'mypy', path = './.venv/bin/mypy' },
      { lang = 'python', name = 'ruff', path = './.venv/bin/ruff' },
      { lang = 'rust', name = 'clippy', path = 'clippy' },
      { lang = 'go', name = 'golangcilint', path = 'golangci-lint' },
      { lang = 'markdown', name = 'markdownlint', path = 'markdownlint' },
    }

    lint.linters_by_ft = ExternalToolsConfig(tools)

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertEnter', 'InsertLeave', 'CursorHold', 'CursorHoldI' }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set('n', '<leader>li', function()
      lint.try_lint()
    end, { desc = 'Lint current buffer' })
  end,
}
