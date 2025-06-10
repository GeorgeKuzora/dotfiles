-- Russian language handling
vim.cmd [[set keymap=russian-jcukenwin]]
vim.cmd [[set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖБЮ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:<>,фисвуапршолдьтщзйкыегмцчняю;abcdefghijklmnopqrstuvwxyz.]]
vim.cmd [[set iminsert=0]]
vim.cmd [[set imsearch=0]]
vim.cmd [[highlight lCursor guifg=NONE guibg=cyan]]

local km = vim.keymap

km.set('i', 'шш', '<esc>', { desc = 'Escape insert mode' })
km.set('n', '<leader>щ', 'o<Esc>k', { desc = 'Insert empty line bellow' })
km.set('n', 'л', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
km.set('n', 'о', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

