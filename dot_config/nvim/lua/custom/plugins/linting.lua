return {
  'mfussenegger/nvim-lint',
  lazy = true,
  event = { 'BufReadPre', 'BufNewFile' }, -- to disable, comment this out
  config = function()
    local lint = require 'lint'

    local configs = {
      { lang = 'python', name = 'flake8', path = './.venv/bin/flake8' },
      { lang = 'python', name = 'mypy', path = './.venv/bin/mypy' },
      { lang = 'python', name = 'ruff', path = './.venv/bin/ruff' },
      { lang = 'rust', name = 'clippy', path = 'clippy' },
      { lang = 'go', name = 'golangcilint', path = 'golangci-lint' },
      { lang = 'markdown', name = 'markdownlint', path = 'markdownlint' },
    }

    local linters = {}

    for _, config in ipairs(configs) do
      if not linters[config.lang] then
        linters[config.lang] = {}
      end
      if vim.fn.executable(config.path) == 1 then
        table.insert(linters[config.lang], config.name)
      end
    end

    lint.linters_by_ft = {
      python = linters.python,
      markdown = linters.markdown,
      rust = linters.rust,
      rst = linters.rust,
      go = linters.go,
      golang = linters.go,
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
