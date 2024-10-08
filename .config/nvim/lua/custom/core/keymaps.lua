local km = vim.keymap

-- NEOVIM QUIRKS HEALING AND MISCELLANEOUS
-- Russian keymaps
km.set('n', '<leader>щ', 'o<Esc>k', { desc = 'Insert empty line bellow' })
km.set('n', 'л', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
km.set('n', 'о', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- escape highlight search
km.set('n', '<C-c>', ':noh<return><esc>')
km.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Remap for dealing with word wrap
km.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
km.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- Quick Spell correction
km.set('n', 'z1', 'z=1<CR><CR>', { desc = 'Quick spell correction' })
-- change word under cursor
km.set('n', '<leader>*', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Change word under cursor in a buffer' })
-- Make file an executable
km.set('n', '<leader>lc', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Set file as executable' })

-- LINES MODIFICATION
km.set('n', 'J', 'mzJ`z', { desc = 'Join Lines' })
-- Insert line without insert mode
km.set('n', '<leader>o', 'o<Esc>k', { desc = 'Insert empty line bellow' })
km.set('n', '<leader>O', 'O<Esc>j', { desc = 'Insert empty line above' })
-- Indentation change
km.set('v', '<', '<gv', { desc = 'Indent left' })
km.set('v', '>', '>gv', { desc = 'Indent right' })
km.set('x', '<', '<gv', { desc = 'Indent left' })
km.set('x', '>', '>gv', { desc = 'Indent right' })

-- MOVING IN BUFFER
km.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll half down' })
km.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll half up' })
km.set('n', 'n', 'nzzzv', { desc = 'Find next' })
km.set('n', 'N', 'Nzzzv', { desc = 'Find previous' })

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
km.set('n', '<leader>bn', vim.cmd.enew, { desc = '[N]ew [B]uffer' })
km.set('n', '<leader>bd', vim.cmd.bdelete, { desc = '[D]elete [B]uffer' })
km.set('n', ']b', ':bnext<CR>', { desc = 'Next buffer' })
km.set('n', '[b', ':bprevious<CR>, { desc = "Previous buffer" }')

--WINDOW MANAGEMENT
km.set('n', '<M-->', '<C-w>-')
km.set('n', '<M-=>', '<C-w>+')
km.set('n', '<M-,>', '<C-w><')
km.set('n', '<M-.>', '<C-w>>')

-- set in a plugin with wezterm windows integration
-- km.set('n', '<M-h>', '<C-w>h')
-- km.set('n', '<M-l>', '<C-w>l')
-- km.set('n', '<M-j>', '<C-w>j')
-- km.set('n', '<M-k>', '<C-w>k')
-- km.set('n', '<M-[>', '<C-w>p')

-- INSERT MODE
km.set('i', '<c-u>', '<c-g>u<c-u>', { desc = 'Delete character' })
km.set('i', '<c-w>', '<c-g>u<c-w>', { desc = 'Delete word' })
km.set('i', "<c-'>", '<c-6>', { desc = 'Switch input method' })

-- DIAGNOSTIC KEYMAPS
km.set('n', '<leader>ld', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
km.set('n', '<leader>ll', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
km.set('n', '<leader>lD', '<cmd>Telescope diagnostics bufnr=0<CR>', { desc = 'Show diagnostics for file' })

-- MOVING IN INTERNAL LISTS
km.set('n', ']l', '<cmd>lnext<CR>zz', { desc = 'Move to next [L]ocation' })
km.set('n', '[l', '<cmd>lprev<CR>zz', { desc = 'Move to previous [L]ocation' })

-- QUICKFIX LIST
km.set('n', ']q', '<cmd>cnext<CR>zz', { desc = 'Move next in [Q]uickFix list' })
km.set('n', '[q', '<cmd>cprev<CR>zz', { desc = 'Move previous in [Q]uickFix list' })

-- NEOVIDE KEYMAPS
km.set('n', '<C-_>', function()
  if vim.g.neovide then
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.05
  end
end, { desc = 'Neovide decrease scale factor' })

km.set('n', '<C-+>', function()
  if vim.g.neovide then
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.05
  end
end, { desc = 'Neovide increase scale factor' })

-- VIM UI KEYMAPS
km.set({ 'n', 'v', 'x' }, 'gx', function()
  local current_path = vim.api.nvim_buf_get_name(0)
  print(current_path)
  vim.ui.open(current_path)
end, { desc = 'Show file in file explorer' })
