vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

if vim.g.vscode then
  require "custom.vscode"
  require "custom.shared"
else
  for _, source in ipairs {
    "custom.core",
    "custom.shared",
    "custom.lazy"
  } do
    local status_ok, fault = pcall(require, source)
    if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
  end
end
