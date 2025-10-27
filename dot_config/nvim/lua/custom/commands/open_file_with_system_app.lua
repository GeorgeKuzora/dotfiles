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
