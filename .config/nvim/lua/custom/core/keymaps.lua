-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
local km = vim.keymap

-- Russian keymaps
km.set('n', '<leader>щ', 'o<Esc>k', { desc = 'Insert empty line bellow' })
km.set('n', 'л', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
km.set('n', 'о', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Leave highlight
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
-- NORMAL MODE
km.set('n', '<leader>*', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Change word under cursor in a buffer' })
-- Make file an executable
km.set('n', '<leader>lc', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Set file as executable' })
km.set('n', ']b', ':bnext<CR>', { desc = 'Next buffer' })
km.set('n', '[b', ':bprevious<CR>, { desc = "Previous buffer" }')
-- Resizing windows
km.set('n', '<M-Up>', ':resize -2<CR>')
km.set('n', '<M-Down>', ':resize +2<CR>')
km.set('n', '<M-Left>', ':vertical resize -2<CR>')
km.set('n', '<M-Right>', ':vertical resize +2<CR>')
-- escape highlight search
km.set('n', '<C-c>', ':noh<return><esc>')
-- km.set('n', '<esc><esc>', ':noh<return><esc>')
--
-- Move text up and down
km.set('v', '<M-j>', ":m '>+1<CR>gv=gv")
km.set('v', '<M-k>', ":m '<-2<CR>gv=gv")
-- km.set("v", "<M-j>", ":m .+1<CR>==")
-- km.set("v", "<M-k>", ":m .-2<CR>==")

-- Move text up and down
km.set('x', '<M-j>', ":move '>+1<CR>gv-gv")
km.set('x', '<M-k>', ":move '<-2<CR>gv-gv")

-- INSERT MODE
km.set('i', '<c-u>', '<c-g>u<c-u>', { desc = 'Delete character' })
km.set('i', '<c-w>', '<c-g>u<c-w>', { desc = 'Delete word' })
km.set('i', '<c-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { desc = 'Hover signature' })
km.set('i', '<c-d>', '<cmd>lua vim.lsp.buf.hover()<CR>', { desc = 'Hover documentation' })
km.set('i', "<c-'>", '<c-6>', { desc = 'Switch input method' })

-- COMPLEX KEYMAPS
-- Diagnostic keymaps
km.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to [previous] [D]iagnostic message' })
km.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to [next] [D]iagnostic message' })
km.set('n', '<leader>ld', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
km.set('n', '<leader>ll', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
km.set('n', '<leader>lD', '<cmd>Telescope diagnostics bufnr=0<CR>', { desc = 'Show diagnostics for file' })
-- QuickFix list
-- km.set('n', ']q', '<cmd>cnext<CR>zz', { desc = 'Move next in [Q]uickFix list' })
-- km.set('n', '[q', '<cmd>cprev<CR>zz', { desc = 'Move previous in [Q]uickFix list' })
km.set('n', ']l', '<cmd>lnext<CR>zz', { desc = 'Move to next [L]ocation' })
km.set('n', '[l', '<cmd>lprev<CR>zz', { desc = 'Move to previous [L]ocation' })

-- Buffers
km.set('n', '<leader>bn', vim.cmd.enew, { desc = '[N]ew [b]uffer' })
km.set('n', '<leader>bd', vim.cmd.bdelete, { desc = '[D]elete [b]uffer' })

-- Windows size management
km.set('n', '<M-->', '<C-w>-')
km.set('n', '<M-=>', '<C-w>+')
km.set('n', '<M-,>', '<C-w><')
km.set('n', '<M-.>', '<C-w>>')

-- Better window navigation
km.set('n', '<C-M-h>', '<C-w>h', { desc = 'Move to the left window' })
km.set('n', '<C-M-l>', '<C-w>l', { desc = 'Move to the right window' })
km.set('n', '<C-M-j>', '<C-w>j', { desc = 'Move to the bottom window' })
km.set('n', '<C-M-k>', '<C-w>k', { desc = 'Move to the top window' })

-- Quick Spell correction
km.set('n', 'z1', 'z=1<CR><CR>', { desc = 'Quick spell correction' })
