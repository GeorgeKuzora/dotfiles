return {
  'mbbill/undotree',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle [U]ndo-tree' })
  end,
}
