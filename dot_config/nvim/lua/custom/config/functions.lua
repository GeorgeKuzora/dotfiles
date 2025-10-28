function AutocmdGroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end
