vim.api.nvim_create_user_command('Format', function(_)
  vim.lsp.buf.format { async = false }
end, { desc = 'Format current buffer with LSP' })

