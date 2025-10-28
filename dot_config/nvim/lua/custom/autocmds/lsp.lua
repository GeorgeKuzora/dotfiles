vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    vim.lsp.inlay_hint.enable(false)

    local nmap = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = ev.buf, silent = true, desc = desc })
    end

    nmap('grn', vim.lsp.buf.rename, 'Rename symbol')
    nmap('gra', vim.lsp.buf.code_action, 'Code action')
    nmap('<leader>lv', function() vim.cmd.Format() end, 'Format buffer with LSP')

    if vim.lsp.inlay_hint then
      nmap('<leader>uh', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(nil))
        if vim.lsp.inlay_hint.is_enabled(nil) then
          print 'Inlay hints enabled'
        else
          print 'Inlay hints disabled'
        end
      end, 'Toggle inlay hints')
    end

    nmap('<C-s>', function() vim.lsp.buf.signature_help() end, 'Signature help')
    vim.keymap.set({ 'i', 'v', 'x' }, '<C-s>', function() vim.lsp.buf.signature_help() end, { desc = 'Signature help' })
    vim.keymap.set({ 'i', 'v', 'x' }, '<C-k>', function() vim.lsp.buf.hover() end, { desc = 'Hover documentation' })

    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, 'Add workspace folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Remove workspace folder')
    nmap('<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, 'List workspace folders')
  end,
})
