-- OrbStack clipboard
vim.g.clipboard = {
  name = 'myClipboard',
  copy = {
    ['+'] = { 'pbcopy' },
    ['*'] = { 'pbcopy' },
  },
  paste = {
    ['+'] = { 'pbpaste' },
    ['*'] = { 'pbpaste' },
  },
  cache_enabled = 1,
}
