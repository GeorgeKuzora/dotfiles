-- COPY FILE PATH
local function copy_file_path(opts)
  local path = vim.fn.expand("%:p")
  if path == "" then
    vim.notify("Current buffer has no file path", vim.log.levels.WARN)
    return
  end
  vim.fn.setreg("+", path)
  vim.notify("Copied to clipboard: " .. path, vim.log.levels.INFO)
end

vim.api.nvim_create_user_command('CopyFilePath', copy_file_path, {
  desc = 'Copy full absolute file path to system clipboard (+ register)',
  bang = true,
})

-- FORMAT BUFFER WITH LSP
vim.api.nvim_create_user_command('Format', function(_)
  vim.lsp.buf.format { async = false }
end, { desc = 'Format current buffer with LSP' })

-- OPEN FILE WITH SYSTEM APP
local function open_file_with_system_app(opts)
  local current_path = vim.api.nvim_buf_get_name(0)
  if current_path == "" then
    vim.notify("No file associated with current buffer", vim.log.levels.WARN)
    return
  end
  vim.ui.open(current_path)
  vim.notify("Opened: " .. current_path, vim.log.levels.INFO)
end

vim.api.nvim_create_user_command('XdgOpenFile', open_file_with_system_app, {
  desc = 'Open current file with system application (e.g., xdg-open)',
  bang = true,
})

-- TOGGLE DIAGNOSTICS MODES
local diag_mode = 0
local function toggle_diagnostics(opts)
  -- Optional: handle bang (e.g., :ToggleDiagnostics!) to reset
  if opts.bang then
    diag_mode = -1
    vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
    vim.notify("Diagnostics: reset to default (full virtual text)", vim.log.levels.INFO)
    return
  end

  -- Cycle through 4 modes
  diag_mode = (diag_mode + 1) % 4

  if diag_mode == 0 then
    vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
  elseif diag_mode == 1 then
    vim.diagnostic.config({ virtual_text = { current_line = true }, virtual_lines = false })
  elseif diag_mode == 2 then
    vim.diagnostic.config({ virtual_text = false, virtual_lines = true })
  else -- diag_mode == 3
    vim.diagnostic.config({ virtual_text = false, virtual_lines = { current_line = true } })
  end

  -- Notify user of current mode
  local mode_names = {
    "Virtual Text (all lines)",
    "Virtual Text (current line only)",
    "Virtual Lines (all lines)",
    "Virtual Lines (current line only)"
  }
  vim.notify("Diagnostics: " .. mode_names[diag_mode + 1], vim.log.levels.INFO)
end

-- Register the user command
vim.api.nvim_create_user_command(
  'ToggleDiagnostics',
  toggle_diagnostics,
  {
    desc = 'Cycle diagnostic display: virtual text → current-line text → virtual lines → current-line lines',
    bang = true,
  }
)

-- TOGGLE DIAGNOSTICS VISIBILITY
local is_enabled = true  -- assume diagnostics start enabled (adjust if needed)
local last_config = vim.deepcopy(vim.diagnostic.config())  -- capture initial state

local function toggle_diagnostics_visibility(opts)
  if is_enabled then
    last_config = vim.deepcopy(vim.diagnostic.config())
    vim.diagnostic.config({ virtual_text = false, virtual_lines = false })
    is_enabled = false
    vim.notify("Diagnostics: hidden", vim.log.levels.INFO)
  else
    vim.diagnostic.config(last_config)
    is_enabled = true
    vim.notify("Diagnostics: restored", vim.log.levels.INFO)
  end
end

vim.api.nvim_create_user_command(
  'ToggleDiagnosticsVisibility',
  toggle_diagnostics_visibility,
  {
    desc = 'Toggle diagnostic visibility (preserves last mode)',
  }
)

-- TOGGLE WRAP LINES
local function toggle_wrap(opts)
  local current_wrap = vim.api.nvim_get_option_value("wrap", { win = 0 })
  vim.api.nvim_set_option_value("wrap", not current_wrap, { win = 0 })
  if opts.bang then
    vim.notify("Wrap: " .. (not current_wrap and "ON" or "OFF"), vim.log.levels.INFO)
  end
end

vim.api.nvim_create_user_command('ToggleWrap', toggle_wrap, {
  desc = 'Toggle line wrapping in current window',
  bang = true,
})
