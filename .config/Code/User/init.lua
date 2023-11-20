-- OPTIONS
-- Declaring local variables to reduce amount of typing

local vscode = require('vscode-neovim')

-- Highlighting and search
vim.opt.hlsearch = true                               -- With highlight search
vim.opt.ignorecase = true                             -- Search ignoring case of letters
vim.opt.infercase = true                              -- infer cases in keyword completion
vim.opt.smartcase = true                              -- Search with ignor case if all small and with case if even one is big
vim.opt.incsearch = true                              -- Search incrementaly when you input request
vim.opt.wrapscan = true                               -- Cycle search results until the end and then move to the beginning

-- System clipboard
vim.opt.clipboard = { 'unnamedplus' }   -- Copy paste between vim and everything else, 'unnamed'

-- KEYBINDINGS

-- Leader keys

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local km = vim.keymap

-- NORMAL MODE
km.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Remap for dealing with word wrap
km.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
km.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
km.set('n', "J", "mzJ`z", { desc = "Join Lines" })
km.set('n', "<C-d>", "<C-d>zz", { desc = "Scroll half down" })
km.set('n', "<C-u>", "<C-u>zz", { desc = "Scroll half up" })
km.set('n', "n", "nzzzv", { desc = "Find next" })
km.set('n', "N", "Nzzzv", { desc = "Find previous" })
km.set('n', "<leader>d", [["_d]], { desc = "Delete without killing" })
km.set('n', "x", '"_x', { desc = "Delete char into void" })
-- Insert live without insert mode
km.set('n', "<leader>o", "o<Esc>k", { desc = "Insert empty line bellow" })
km.set('n', "<leader>O", "O<Esc>j", { desc = "Insert empty line above" })
-- Move text up and down
km.set("n", "<M-j>", "<Esc>:m .+1<CR>==")
km.set("n", "<M-k>", "<Esc>:m .-2<CR>==")

-- escape highlight search
km.set('n', "<leader>n", "<cmd>noh<cr>")
-- VISUAL MODE
km.set('v', "<", "<gv", { desc = "Indent left" })
km.set('v', ">", ">gv", { desc = "Indent right" })
km.set('v', "<leader>p", [["_dP]], { desc = "Paste without killing" })
km.set('v', "<leader>d", [["_d]], { desc = "Delete without killing" })

-- VISUALBLOCK MODE
km.set('x', "<", "<gv", { desc = "Indent left" })
km.set('x', ">", ">gv", { desc = "Indent right" })
km.set('x', "<leader>p", [["_dP]], { desc = "Paste without killing" })
km.set('x', "<leader>d", [["_d]], { desc = "Delete without killing" })
