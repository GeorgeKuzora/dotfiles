-- LSP CONFIG

local servers = {
  -- 'basedpyright',
  'docker_compose_language_service',
  'docker_language_server',
  'gopls',
  'html',
  'lua_ls',
  'marksman',
  -- 'pyrefly',
  'pyright',
  'rust_analyzer',
  'typos_lsp',
}

for _, server_name in ipairs(servers) do
  vim.lsp.enable(server_name, true)
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = AutocmdGroup 'UserLspConfig',
  callback = function(event)
    vim.lsp.inlay_hint.enable(false)

    local nmap = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = event.buf, silent = true, desc = desc })
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

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities({}, false))
    vim.lsp.config('*', { capabilities = capabilities })
  end,
})
