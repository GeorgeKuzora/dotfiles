-- DIAGNOSTICS CONFIG

---@param diagnostic table
---@return string
DiagnosticFormat = function(diagnostic)
  local msg = diagnostic.message
  if diagnostic.source then
    msg = string.format("%s: %s", diagnostic.source, msg)
  end
  return msg
end

local sv = vim.diagnostic.severity

local function diagnostic_prefix(diagnostic, i, total)
  local severity = diagnostic.severity
  local hl_group = 'Normal'

  if severity == sv.ERROR then
    hl_group = 'DiagnosticSignError'
  elseif severity == sv.WARN then
    hl_group = 'DiagnosticSignWarn'
  elseif severity == sv.INFO then
    hl_group = 'DiagnosticSignInfo'
  elseif severity == sv.HINT then
    hl_group = 'DiagnosticSignHint'
  end

  local prefix = string.format('%d/%d ', i, total)
  return prefix, hl_group
end

DiagnosticConfig = {
  virtual_text = {
    format = DiagnosticFormat,
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focused = false,
    style = 'minimal',
    border = 'rounded',
    source = true,
    header = '',
    prefix = diagnostic_prefix,
  },
  signs = {
    enabled = true,
    text = {
      [sv.ERROR] = ' ',
      [sv.WARN] = ' ',
      [sv.HINT] = '󰠠 ',
      [sv.INFO] = ' ',
    },
    -- numhl = {
    --   [sv.ERROR] = 'DiagnosticSignError',
    --   [sv.WARN] = 'DiagnosticSignWarn',
    --   [sv.HINT] = 'DiagnosticSignHint',
    --   [sv.INFO] = 'DiagnosticSignInfo',
    -- },
    -- linehl = {
    --   [sv.ERROR] = 'DiagnosticLineBackgroundError',
    --   [sv.WARN] = 'DiagnosticLineBackgroundWarn',
    --   [sv.HINT] = 'DiagnosticLineBackgroundHint',
    --   [sv.INFO] = 'DiagnosticLineBackgroundInfo',
    -- },
  },
}

vim.diagnostic.config(DiagnosticConfig)
