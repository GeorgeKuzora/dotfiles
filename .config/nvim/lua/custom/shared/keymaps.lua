local km = vim.keymap

km.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Remap for dealing with word wrap
km.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
km.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

km.set('n', 'J', 'mzJ`z', { desc = 'Join Lines' })
km.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll half down' })
km.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll half up' })
km.set('n', 'n', 'nzzzv', { desc = 'Find next' })
km.set('n', 'N', 'Nzzzv', { desc = 'Find previous' })
km.set('n', '<leader>d', [["_d]], { desc = 'Delete without killing' })
km.set('n', 'x', '"_x', { desc = 'Delete char into void' })
-- Insert line without insert mode
km.set('n', '<leader>o', 'o<Esc>k', { desc = 'Insert empty line bellow' })
km.set('n', '<leader>O', 'O<Esc>j', { desc = 'Insert empty line above' })
-- Move text up and down
km.set('n', '<M-j>', '<Esc>:m .+1<CR>==')
km.set('n', '<M-k>', '<Esc>:m .-2<CR>==')

-- VISUAL MODE
km.set('v', '<', '<gv', { desc = 'Indent left' })
km.set('v', '>', '>gv', { desc = 'Indent right' })
km.set('v', '<leader>p', [["_dP]], { desc = 'Paste without killing' })
km.set('v', '<leader>d', [["_d]], { desc = 'Delete without killing' })

-- VISUALBLOCK MODE
km.set('x', '<', '<gv', { desc = 'Indent left' })
km.set('x', '>', '>gv', { desc = 'Indent right' })
km.set('x', '<leader>p', [["_dP]], { desc = 'Paste without killing' })
km.set('x', '<leader>d', [["_d]], { desc = 'Delete without killing' })
