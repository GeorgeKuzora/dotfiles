vim.g.mapleader = " "
vim.g.maplocalleader = " "

local km = vim.keymap
local vscode = require("vscode-neovim")

-- escape highlight search
km.set("n", "<leader>n", "<cmd>noh<cr>")

km.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

km.set("n", "J", "mzJ`z", { desc = "Join Lines" })
km.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll half down" })
km.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll half up" })
km.set("n", "n", "nzzzv", { desc = "Find next" })
km.set("n", "N", "Nzzzv", { desc = "Find previous" })
km.set("n", "<leader>d", [["_d]], { desc = "Delete without killing" })
km.set("n", "x", '"_x', { desc = "Delete char into void" })
-- Insert line without insert mode
km.set("n", "<leader>o", "o<Esc>k", { desc = "Insert empty line bellow" })
km.set("n", "<leader>O", "O<Esc>j", { desc = "Insert empty line above" })
-- Move text up and down
km.set("n", "<M-j>", "<Esc>:m .+1<CR>==")
km.set("n", "<M-k>", "<Esc>:m .-2<CR>==")

-- VISUAL MODE
km.set("v", "<", "<gv", { desc = "Indent left" })
km.set("v", ">", ">gv", { desc = "Indent right" })
km.set("v", "<leader>p", [["_dP]], { desc = "Paste without killing" })
km.set("v", "<leader>d", [["_d]], { desc = "Delete without killing" })

-- VISUALBLOCK MODE
km.set("x", "<", "<gv", { desc = "Indent left" })
km.set("x", ">", ">gv", { desc = "Indent right" })
km.set("x", "<leader>p", [["_dP]], { desc = "Paste without killing" })
km.set("x", "<leader>d", [["_d]], { desc = "Delete without killing" })

-- OPTIONS

local g = vim.g
local o = vim.o
local wo = vim.wo
local opt = vim.opt
local a = vim.api

-- highlihting and search
opt.hlsearch = true -- With highlight search
opt.ignorecase = true -- Search ignoring case of letters
opt.infercase = true -- infer cases in keyword completion
opt.smartcase = true -- Search with ignor case if all small and with case if even one is big
opt.incsearch = true -- Search incrementaly when you input request
opt.wrapscan = true -- Cycle search results until the end and then move to the beginning

opt.clipboard = { "unnamedplus" } -- Copy paste between vim and everything else, 'unnamed'

opt.autoindent = true -- auto indention
opt.smartindent = true -- smart indention
opt.copyindent = true -- copy the previous indentation on autoindenting
opt.shiftround = true -- When shifting lines, round the indentation to the nearest multiple of shiftwidth.
opt.shiftwidth = 4 -- When shifting, indent using four spaces.
opt.expandtab = true -- create spaces from tab
opt.smarttab = true -- Insert “tabstop” number of spaces when the “tab” key is pressed.
opt.tabstop = 4 -- Indent using four characters.
opt.softtabstop = 4 -- Indent using four spaces.
