vim.g.mapleader = " "
vim.g.maplocalleader = " "

local km = vim.keymap
local vscode = require("vscode-neovim")

-- escape highlight search
km.set({ "n", "v" }, "<leader>n", "<Nop>", { silent = true })

-- km.set("n", "J", "mzJ`z", { desc = "Join Lines" })

-- Don't use registers
km.set({ "n", "v", "x" }, "<leader>d", [["_d]], { desc = "Delete without killing" })
km.set({ "n", "v", "x" }, "<leader>c", [["_c]], { desc = "Change without killing" })
km.set({ "n" }, "x", '"_x', { desc = "Delete char into void" })
km.set({ "n" }, "s", '"_s', { desc = "Change char into void" })
km.set({ "v", "x" }, "<leader>p", [["_dP]], { desc = "Paste without killing" })
km.set({ "v", "x" }, "<leader>P", [["_dP]], { desc = "Paste without killing" })
km.set({ 'n', 'v', 'x' }, '<leader>D', [["_D]], { desc = 'Delete until end of the line without killing' })
km.set({ 'n', 'v', 'x' }, '<leader>C', [["_C]], { desc = 'Change until end of the line without killing' })

-- Insert line without insert mode
km.set("n", "]<space>", "o<Esc>k", { desc = "Insert empty line bellow" })
km.set("n", "[<space>", "O<Esc>j", { desc = "Insert empty line above" })

-- Indentation
km.set({ "v", "x" }, "<", "<gv", { desc = "Indent left" })
km.set({ "v", "x" }, ">", ">gv", { desc = "Indent right" })

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
