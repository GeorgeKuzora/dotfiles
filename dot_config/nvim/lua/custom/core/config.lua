-- DIAGNOSTICS CONFIG

vim.diagnostic.config {
  virtual_text = true,
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focused = false,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
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
