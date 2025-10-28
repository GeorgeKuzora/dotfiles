-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd('FileType', {
  group = AutocmdGroup 'wrap_spell',
  pattern = { 'gitcommit', 'markdown' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})
