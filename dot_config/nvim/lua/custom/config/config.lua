-- DIAGNOSTICS CONFIG

local severity = vim.diagnostic.severity

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
    prefix = '● ',
  },
  signs = {
    enabled = true,
    text = {
      [severity.ERROR] = ' ',
      [severity.WARN] = ' ',
      [severity.HINT] = '󰠠 ',
      [severity.INFO] = ' ',
    },
    numhl = {
      [severity.ERROR] = 'DiagnosticSignError',
      [severity.WARN] = 'DiagnosticSignWarn',
      [severity.HINT] = 'DiagnosticSignHint',
      [severity.INFO] = 'DiagnosticSignInfo',
    },
    linehl = {
      [severity.ERROR] = 'DiagnosticLineBackgroundError',
      [severity.WARN] = 'DiagnosticLineBackgroundWarn',
      [severity.HINT] = 'DiagnosticLineBackgroundHint',
      [severity.INFO] = 'DiagnosticLineBackgroundInfo',
    },
  },
}
