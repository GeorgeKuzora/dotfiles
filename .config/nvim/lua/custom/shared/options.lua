local g   = vim.g
local o   = vim.o
local wo  = vim.wo
local opt = vim.opt
local a   = vim.api

-- highlihting and search
opt.hlsearch = true                               -- With highlight search
opt.ignorecase = true                             -- Search ignoring case of letters
opt.infercase = true                              -- infer cases in keyword completion
opt.smartcase = true                              -- Search with ignor case if all small and with case if even one is big
opt.incsearch = true                              -- Search incrementaly when you input request
opt.wrapscan = true                               -- Cycle search results until the end and then move to the beginning

opt.clipboard = { 'unnamedplus' }   -- Copy paste between vim and everything else, 'unnamed'
