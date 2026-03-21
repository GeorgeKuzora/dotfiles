-- NOT USED
-- Remap for dealing with word wrap
-- map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- map('n', 'J', 'mzJ`z', { desc = 'Join Lines' })
-- Insert line without insert mode
-- map('n', '<leader>o', 'o<Esc>k', { desc = 'Insert empty line bellow' })
-- map('n', '<leader>O', 'O<Esc>j', { desc = 'Insert empty line above' })
-- Moving between windows
-- map('n', '<C-h>', '<C-w>h')
-- map('n', '<C-l>', '<C-w>l')
-- map('n', '<C-j>', '<C-w>j')
-- map('n', '<C-k>', '<C-w>k')

-- NEOVIM QUALITY OF LIFE IMPROVEMENTS
Map({ 'n', 'v', 'x' }, '<Space>', '<Nop>', { silent = true, desc = 'Space do nothing' })
Map('i', 'ii', '<esc>', { desc = 'Escape insert mode' })
Map('n', '<leader>*', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Change word under cursor in a buffer' })
Map('v', '<leader>*', [["yy:%s/\V<C-r>=escape(@y, '/' )<CR>/<C-r>=escape(@y, '&')<CR>/gI<Left><Left><Left>]], { desc = 'Change visually selected text in buffer' })

-- INDENTATION CHANGE
Map('v', '<', '<gv', { desc = 'Indent left' })
Map('v', '>', '>gv', { desc = 'Indent right' })
Map('x', '<', '<gv', { desc = 'Indent left' })
Map('x', '>', '>gv', { desc = 'Indent right' })

-- MOVING IN BUFFER
Map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll half down' })
Map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll half up' })
Map('n', 'n', 'nzzzv', { desc = 'Find next' })
Map('n', 'N', 'Nzzzv', { desc = 'Find previous' })
Map('n', '}', '}zzzv', { desc = 'Next paragraph' })
Map('n', '{', '{zzzv', { desc = 'Previous paragraph' })

-- PASTING AND YANKING
Map({ 'n', 'v', 'x' }, '<leader>d', [["_d]], { desc = 'Delete without killing' })
Map({ 'n', 'v', 'x' }, '<leader>c', [["_c]], { desc = 'Change without killing' })
Map({ 'n', 'v', 'x' }, '<leader>D', [["_D]], { desc = 'Delete until end of the line without killing' })
Map({ 'n', 'v', 'x' }, '<leader>C', [["_C]], { desc = 'Change until end of the line without killing' })
Map('n', 'x', '"_x', { desc = 'Delete char into void' })
Map('n', 's', '"_s', { desc = 'Change char into void' })

-- WORKING WITH BUFFERS
Map('n', '<leader>bn', vim.cmd.enew, { desc = 'New buffer' })
Map('n', '<leader>bd', vim.cmd.bdelete, { desc = 'Delete buffer' })

--WINDOW MANAGEMENT
Map('n', '<M-->', '<C-w>-')
Map('n', '<M-=>', '<C-w>+')
Map('n', '<M-,>', '<C-w><')
Map('n', '<M-.>', '<C-w>>')

-- INSERT MODE
Map('i', '<c-u>', '<c-g>u<c-u>', { desc = 'Delete character' })
Map('i', '<c-w>', '<c-g>u<c-w>', { desc = 'Delete word' })

-- DIAGNOSTICS
Map('n', '<leader>kd', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
Map('n', '<leader>kD', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- QUICKFIX
Map('n', '<leader>qq', function() vim.cmd.copen() end, { desc = 'Open quickfix list' })
Map('n', '<leader>qw', function() vim.cmd.cclose() end, { desc = 'Open quickfix list' })

-- NVIM UI
Map('n', '<leader>ud', function() vim.cmd.ToggleDiagnostics() end, { desc = 'Toggle diagnostics mode' })
Map('n', '<leader>ut', function() vim.cmd.ToggleDiagnosticsVisibility() end, { desc = 'Toggle diagnostics visibility' })
Map('n', '<leader>ue', function() vim.diagnostic.hide(nil, 0) end, { desc = 'Hide diagnostic decorations' })
Map('n', '<leader>uD', function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end, { desc = 'Toggle diagnostic' })
Map('n', '<leader>uw', function() vim.cmd.ToggleWrap() end, { desc = 'Toggle wrap' })
Map('n', '<leader>uo', function() vim.cmd.XdgOpenFile() end, { desc = 'Show file in xdg-open' })
Map('n', '<leader>ux', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Set file as executable' })
Map('n', '<leader>un', ':noh<return><esc>', { desc = 'Escape highlight search' })
Map('n', "<leader>uy", function() vim.cmd.CopyFilePath() end, { desc = 'Copy relative file path' })
Map('n', "<leader>uY", function() vim.cmd.CopyAbsFilePath() end, { desc = 'Copy absolute file path' })

-- TABS
Map('n', '<leader>tn', function() vim.cmd.tabnew() end, { desc = 'Create new tab' })
Map('n', '<leader>tc', function() vim.cmd.tabclose() end, { desc = 'Close current tab' })
Map('n', '<leader>to', function() vim.cmd.tabonly() end, { desc = 'Close all other tabs' })
Map('n', '[t', function() vim.cmd.tabprevious() end, { desc = 'Go to previous tab' })
Map('n', ']t', function() vim.cmd.tabnext() end, { desc = 'Go to next tab' })
