local g = vim.g
local o = vim.o
local wo = vim.wo
local opt = vim.opt
local a = vim.api

-- Optimizations
vim.opt.viewoptions:remove 'curdir' -- disable saving current directory with views
vim.opt.shortmess:append { s = true, I = true, W = true, c = true, C = true } -- disable search count wrap and startup messages
vim.opt.backspace:append { 'nostop' } -- don't stop backspace at insert
if vim.fn.has 'nvim-0.9' == 1 then
  vim.opt.diffopt:append 'linematch:60' -- enable line match diff algorithm
end

-- Set vim options here (vim.<first_key>.<second_key> = value)
vim.cmd [[set keymap=russian-jcukenwin]]
vim.cmd [[set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖБЮ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:<>,фисвуапршолдьтщзйкыегмцчняю;abcdefghijklmnopqrstuvwxyz.]]
vim.cmd [[set iminsert=0]]
vim.cmd [[set imsearch=0]]
vim.cmd [[highlight lCursor guifg=NONE guibg=cyan]]
opt.grepprg = 'rg --vimgrep --smart-case --follow' -- Better grep command

-- :f in current path recursively
vim.cmd 'set path+=**'

-- Enable break indent
o.breakindent = true

-- Decrease update time
o.updatetime = 250
o.timeoutlen = 300

-- Set completeopt to have a better completion experience in insert mode
opt.completeopt = { 'menu', 'menuone', 'preview', 'noselect' }

-- highlihting and search
opt.hlsearch = true -- With highlight search
opt.ignorecase = true -- Search ignoring case of letters
opt.infercase = true -- infer cases in keyword completion
opt.smartcase = true -- Search with ignore case if all small and with case if even one is big
opt.incsearch = true -- Search incrementally when you input request
opt.wrapscan = true -- Cycle search results until the end and then move to the beginning

-- indentation
opt.autoindent = true -- auto indention
opt.smartindent = true -- smart indention
opt.copyindent = true -- copy the previous indentation on autoindenting
opt.preserveindent = true
opt.shiftround = true -- When shifting lines, round the indentation to the nearest multiple of shiftwidth.
opt.shiftwidth = 4 -- When shifting, indent using four spaces.
opt.expandtab = true -- create spaces from tab
opt.smarttab = true -- Insert “tabstop” number of spaces when the “tab” key is pressed.
opt.tabstop = 4 -- Indent using four characters.
opt.softtabstop = 4 -- Indent using four spaces.
-- lines
opt.display = 'lastline' -- Always try to show a paragraph’s last line.
opt.encoding = 'utf-8' -- Use an encoding that supports unicode.
opt.fileencoding = 'utf-8' -- The encoding written to file
opt.wrap = false -- Enable line wrapping.
opt.linebreak = true -- Avoid wrapping a line in the middle of a word.
opt.scrolloff = 8 -- The number of screen lines to keep above and below the cursor.
opt.sidescrolloff = 5 -- The number of screen columns to keep to the left and right of the cursor.
opt.syntax = 'enable' -- Enable syntax higlihting
-- display
wo.number = true -- Show line numbers on the sidebar.
opt.relativenumber = false -- Show line number on the current line and relative numbers on all other lines.
opt.laststatus = 3 -- Always display the status bar.
opt.ruler = true -- Always show cursor position.
opt.wildmenu = true -- Display command line’s tab complete options as a menu.
opt.tabpagemax = 50 -- Maximum number of tab pages that can be opened from the command line.
opt.errorbells = false -- Disable beep on errors.
opt.visualbell = true -- Flash the screen instead of beeping on errors.
opt.title = true -- set the window’s title, reflecting the file currently being edited.
-- folding
opt.foldenable = true -- enable fold for nvim-ufo
opt.foldmethod = 'manual'                         -- Fold based on indention levels.
opt.foldlevel = 99 -- set high foldlevel for nvim-ufo
opt.foldlevelstart = 99 -- start with all code unfolded
-- undoing
opt.autoread = true -- Automatically re-read files if unmodified inside Vim.
opt.backspace = { 'indent', 'eol', 'start' } -- Allow backspacing over indention, line breaks and insertion start.
opt.dir = vim.fn.expand('$HOME/.cache/nvim') -- Directory to store backup files.
opt.undodir = vim.fn.expand('$HOME/.cache/nvim/undodir') -- Set undofiles dir
opt.undofile = true -- Set undofiles
opt.confirm = true -- Display a confirmation dialog when closing an unsaved file.
opt.history = 10000 -- Increase the undo limit.
opt.modeline = false -- Ignore file’s mode lines; use vimrc configurations instead.
opt.swapfile = false -- Disable swap files. if string.find(vim.fn.expand('$SHELL'), 'zsh') ~= nil then
if string.find(vim.fn.expand('$SHELL'), 'zsh') ~= nil then
  opt.shell = '/usr/bin/zsh'
elseif string.find(vim.fn.expand('$SHELL'), 'bash') ~= nil then
  opt.shell = '/usr/bin/bash'
else
  opt.shell = vim.fn.expand('$SHELL')
end
opt.spell = true --Enable spellchecking.
opt.spelllang = { 'en_us', 'ru_ru' }
opt.wildignore = { '.pyc', '.swp' } -- Ignore files matching these patterns when opening files based on a glob pattern.
opt.clipboard = { 'unnamedplus' } -- Copy paste between vim and everything else, 'unnamed'
-- UI and windows
opt.signcolumn = 'yes' -- sets vim.opt.signcolumn to auto
opt.colorcolumn = '80,100,120' -- colored line on characters
opt.termguicolors = true
opt.mouse = 'a' -- Enable your mouse
opt.splitbelow = true -- Horizontal splits will automatically be below
opt.splitright = true -- Vertical splits will automatically be to the right
opt.termguicolors = true -- Support true colors
opt.conceallevel = 0 -- So that I can see `` in markdown files
opt.cursorline = true -- Enable highlighting of the current line
opt.backup = false -- This is recommended by coc
opt.writebackup = false -- This is recommended by coc
-- Automation
opt.autochdir = false -- Your working directory will always be the same as your working directory
opt.cp = false -- 'compatible' is not set
opt.formatoptions = 'tcqjronl'
opt.cmdheight = 1 -- command line minimum high
opt.pumheight = 10 -- height of the pop up menu
opt.virtualedit = 'block' -- allow going past end of line in visual block mode
g.hidden = true -- Hide files in the background instead of closing them.
g.autoformat_enabled = true -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
g.cmp_enabled = true -- enable completion at start
g.autopairs_enabled = true -- enable autopairs at start
g.diagnostics_mode = 3 -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
g.icons_enabled = true -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
g.ui_notifications_enabled = true -- disable notifications when toggling UI elements
g.codelens_enabled = true -- enable or disable automatic codelens refreshing for lsp that support it
g.highlighturl_enabled = true -- highlight URLs by default
g.inlay_hints_enabled = false -- enable or disable LSP inlay hints on startup (Neovim v0.10 only)
g.lsp_handlers_enabled = true -- enable or disable default vim.lsp.handlers (hover and signature help)
g.semantic_tokens_enabled = true -- enable or disable LSP semantic tokens on startup
g.git_worktrees = nil -- enable git integration for detached worktrees (specify a table where each entry is of the form { toplevel = vim.env.HOME, gitdir=vim.env.HOME .. "/.dotfiles" })

-- LazyVim options
opt.grepformat = '%f:%l:%c:%m'
opt.inccommand = 'split' -- preview incremental substitute
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.pumblend = 10
opt.sessionoptions = { 'blank', 'buffers', 'curdir', 'folds', 'help', 'tabpages', 'winsize', 'winpos', 'terminal', 'localoptions' }
opt.showmode = false -- Dont show mode since we have a statusline
opt.splitkeep = 'screen'
opt.wildmode = 'longest:full,full' -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.fillchars = {
  foldopen = '',
  foldclose = '',
  fold = ' ',
  foldsep = ' ',
  diff = '╱',
  eob = ' ',
}
if vim.fn.has 'nvim-0.10' == 1 then
  opt.smoothscroll = true
end
-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- NEOVIDE OPTIONS
vim.o.guifont = 'VictorMono Nerd Font:h14'
vim.g.neovide_scale_factor = 1.2
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_cursor_animation_length = 0.0
vim.g.neovide_cursor_vfx_mode = ''
