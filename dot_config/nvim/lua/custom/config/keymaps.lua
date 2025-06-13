local km = vim.keymap

-- NOT USED
-- Remap for dealing with word wrap
-- km.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- km.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- km.set('n', 'J', 'mzJ`z', { desc = 'Join Lines' })
-- Insert line without insert mode
-- km.set('n', '<leader>o', 'o<Esc>k', { desc = 'Insert empty line bellow' })
-- km.set('n', '<leader>O', 'O<Esc>j', { desc = 'Insert empty line above' })
-- Moving between windows
-- km.set('n', '<C-h>', '<C-w>h')
-- km.set('n', '<C-l>', '<C-w>l')
-- km.set('n', '<C-j>', '<C-w>j')
-- km.set('n', '<C-k>', '<C-w>k')

-- NEOVIM QUALITY OF LIFE IMPROVEMENTS
km.set({ 'n', 'v', 'x' }, '<Space>', '<Nop>', { silent = true, desc = 'Space do nothing' })
km.set('i', 'ii', '<esc>', { desc = 'Escape insert mode' })
km.set('n', 'z1', 'z=1<CR><CR>', { desc = 'Quick spell correction' })
km.set('n', '<leader>*', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Change word under cursor in a buffer' })

-- INDENTATION CHANGE
km.set('v', '<', '<gv', { desc = 'Indent left' })
km.set('v', '>', '>gv', { desc = 'Indent right' })
km.set('x', '<', '<gv', { desc = 'Indent left' })
km.set('x', '>', '>gv', { desc = 'Indent right' })

-- MOVING IN BUFFER
km.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll half down' })
km.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll half up' })
km.set('n', 'n', 'nzzzv', { desc = 'Find next' })
km.set('n', 'N', 'Nzzzv', { desc = 'Find previous' })
km.set('n', '}', '}zzzv', { desc = 'Next paragraph' })
km.set('n', '{', '{zzzv', { desc = 'Previous paragraph' })

-- PASTING AND YANKING
km.set({ 'n', 'v', 'x' }, '<leader>d', [["_d]], { desc = 'Delete without killing' })
km.set({ 'n', 'v', 'x' }, '<leader>c', [["_c]], { desc = 'Change without killing' })
km.set({ 'n', 'v', 'x' }, '<leader>D', [["_D]], { desc = 'Delete until end of the line without killing' })
km.set({ 'n', 'v', 'x' }, '<leader>C', [["_C]], { desc = 'Change until end of the line without killing' })
km.set('n', 'x', '"_x', { desc = 'Delete char into void' })
km.set('n', 's', '"_s', { desc = 'Change char into void' })
km.set({ 'v', 'x' }, '<leader>p', [["_dP]], { desc = 'Paste without killing' })
km.set({ 'v', 'x' }, '<leader>P', [["_dP]], { desc = 'Paste without killing' })

-- WORKING WITH BUFFERS
km.set('n', '<leader>bn', vim.cmd.enew, { desc = 'New buffer' })
km.set('n', '<leader>bd', vim.cmd.bdelete, { desc = 'Delete buffer' })

--WINDOW MANAGEMENT
km.set('n', '<M-->', '<C-w>-')
km.set('n', '<M-=>', '<C-w>+')
km.set('n', '<M-,>', '<C-w><')
km.set('n', '<M-.>', '<C-w>>')

-- INSERT MODE
km.set('i', '<c-u>', '<c-g>u<c-u>', { desc = 'Delete character' })
km.set('i', '<c-w>', '<c-g>u<c-w>', { desc = 'Delete word' })

-- DIAGNOSTICS
km.set('n', '<leader>ld', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
km.set('n', '<leader>lD', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- NVIM UI
km.set({ 'n' }, '<leader>uo', function()
  local current_path = vim.api.nvim_buf_get_name(0)
  print(current_path)
  vim.ui.open(current_path)
end, { desc = 'Show file in xdg-open' })

km.set('n', '<leader>uw', function()
  local current_wrap = vim.api.nvim_get_option_value("wrap", { win = 0 })
  vim.api.nvim_set_option_value("wrap", not current_wrap, { win = 0 })
end, { desc = 'Toggle wrap' })

km.set('n', '<leader>ud', function()
  local new_lines = not vim.diagnostic.config().virtual_lines
  local new_text = not vim.diagnostic.config().virtual_text
  vim.diagnostic.config({ virtual_lines = new_lines, virtual_text = new_text })
end, { desc = 'Toggle diagnostic virtual lines' })

km.set('n', '<leader>uD', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = 'Toggle diagnostic' })

km.set('n', '<leader>ux', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Set file as executable' })
km.set('n', '<leader>un', ':noh<return><esc>', { desc = 'Escape highlight search' })
