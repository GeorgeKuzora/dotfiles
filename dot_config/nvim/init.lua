vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

for _, source in ipairs {
  'custom',
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then
    vim.notify('Failed to load ' .. source .. '\n\n' .. fault, vim.log.levels.ERROR)
  end
end
