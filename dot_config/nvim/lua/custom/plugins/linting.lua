return {
  'mfussenegger/nvim-lint',
  lazy = true,
  event = { 'BufReadPre', 'BufNewFile' }, -- to disable, comment this out
  config = function()
    local lint = require 'lint'
    local python_linters = {}
    local rust_linters = {}
    local go_linters = {}

    if vim.fn.executable('./.venv/bin/flake8') == 1 then
      table.insert(python_linters, 'flake8')
    end
    if vim.fn.executable('./.venv/bin/mypy') == 1 then
      table.insert(python_linters, 'mypy')
    end
    if vim.fn.executable('./.venv/bin/ruff') == 1 then
      table.insert(python_linters, 'ruff')
    end
    if vim.fn.executable('clippy') == 1 then
      table.insert(rust_linters, 'clippy')
    end
    if vim.fn.executable('golangci-lint') == 1 then
      table.insert(go_linters, 'golangcilint')
    end

    lint.linters_by_ft = {
      python = python_linters,
      markdown = { 'markdownlint' },
      rust = rust_linters,
      rst = rust_linters,
      go = go_linters,
      golang = go_linters,
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
