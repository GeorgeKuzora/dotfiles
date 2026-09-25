-- Russian language handling
vim.cmd [[set keymap=russian-jcukenwin]]
vim.cmd [[set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖБЮ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:<>,фисвуапршолдьтщзйкыегмцчняю;abcdefghijklmnopqrstuvwxyz.]]
vim.cmd [[set iminsert=0]]
vim.cmd [[set imsearch=0]]
vim.cmd [[highlight lCursor guifg=NONE guibg=cyan]]

Map('i', 'шш', '<esc>', { desc = 'Escape insert mode' })
Map('n', 'л', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
Map('n', 'о', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
Map('n', '<C-к>', '<C-r>', { desc = 'Redo' })
Map('n', '<C-в>', '<C-d>', { desc = 'Scroll half page down' })
Map('n', '<C-г>', '<C-u>', { desc = 'Scroll half page up' })

