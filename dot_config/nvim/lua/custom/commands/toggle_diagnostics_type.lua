-- Keep state in a local variable (private to this module)
local diag_mode = 0

-- Define the toggle logic
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
