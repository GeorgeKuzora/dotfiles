return {
  'mfussenegger/nvim-lint',
  lazy = true,
  event = { 'BufReadPre', 'BufNewFile' }, -- to disable, comment this out
  config = function()
    local lint = require 'lint'
    local python_linters = {}

    if vim.fn.executable('flake8') == 1 then
      table.insert(python_linters, 'flake8')
    end
    if vim.fn.executable('mypy') == 1 then
      table.insert(python_linters, 'mypy')
    end
    if vim.fn.executable('ruff') == 1 then
      table.insert(python_linters, 'ruff')
    end

    lint.linters_by_ft = {
      javascript = { 'eslint_d' },
      typescript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      svelte = { 'eslint_d' },
      python = python_linters,
      markdown = { 'markdownlint' },
    }

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
