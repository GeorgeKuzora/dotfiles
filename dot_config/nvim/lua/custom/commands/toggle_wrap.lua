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
