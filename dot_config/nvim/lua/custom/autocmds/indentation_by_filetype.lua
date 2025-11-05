local auto_group = AutocmdGroup 'Indent'

-- Set filetype-specific settings
vim.api.nvim_create_autocmd("FileType", {
  group = auto_group,
  pattern = { "python", "py", "golang", "go", "rust", "rst", "rs" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = auto_group,
  pattern = { "lua", "javascript", "typescript", "json", "html", "css" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})
