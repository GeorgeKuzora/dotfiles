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
