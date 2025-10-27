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

