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
km.set('n', '<leader>kd', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
km.set('n', '<leader>kD', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- QUICKFIX
km.set('n', '<leader>qq', function() vim.cmd.copen() end, { desc = 'Open quickfix list' })
km.set('n', '<leader>qw', function() vim.cmd.cclose() end, { desc = 'Open quickfix list' })

-- NVIM UI
km.set('n', '<leader>ud', function() vim.cmd.ToggleDiagnostics() end, { desc = 'Toggle diagnostics mode' })
km.set('n', '<leader>ut', function() vim.cmd.ToggleDiagnosticsVisibility() end, { desc = 'Toggle diagnostics visibility' })
km.set('n', '<leader>ue', function() vim.diagnostic.hide(nil, 0) end, { desc = 'Hide diagnostic decorations' })
km.set('n', '<leader>uD', function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end, { desc = 'Toggle diagnostic' })
km.set('n', '<leader>uw', function() vim.cmd.ToggleWrap() end, { desc = 'Toggle wrap' })
km.set('n', '<leader>uo', function() vim.cmd.XdgOpenFile() end, { desc = 'Show file in xdg-open' })
km.set('n', '<leader>ux', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Set file as executable' })
km.set('n', '<leader>un', ':noh<return><esc>', { desc = 'Escape highlight search' })
km.set('n', "<leader>uy", function() vim.cmd.CopyFilePath() end, { desc = 'Copy full file path' })

-- TABS
km.set('n', '<leader>tn', function() vim.cmd.tabnew() end, { desc = 'Create new tab' })
km.set('n', '<leader>tc', function() vim.cmd.tabclose() end, { desc = 'Close current tab' })
km.set('n', '<leader>to', function() vim.cmd.tabonly() end, { desc = 'Close all other tabs' })
km.set('n', '[t', function() vim.cmd.tabprevious() end, { desc = 'Go to previous tab' })
km.set('n', ']t', function() vim.cmd.tabnext() end, { desc = 'Go to next tab' })
