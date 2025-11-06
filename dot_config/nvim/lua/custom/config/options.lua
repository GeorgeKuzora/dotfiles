local g = vim.g
local o = vim.o
local wo = vim.wo
local opt = vim.opt
local api = vim.api
local fn = vim.fn

-- Leader keys
g.mapleader = " " -- Set leader key to space
g.maplocalleader = " " -- Set local leader key (NEW)
-- Optimizations
opt.viewoptions:remove 'curdir' -- disable saving current directory with views
opt.shortmess:append { I = true, s = true, W = true, c = true, C = true } -- disable startup message + other optimization
opt.backspace:append { 'nostop' } -- don't stop backspace at insert
opt.diffopt:append 'linematch:60' -- enable line match diff algorithm
opt.grepprg = 'rg --vimgrep --smart-case --follow' -- Better grep command
opt.path:append("**") -- include subdirectories in search

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
opt.showmatch = true -- Highlight matching brackets
opt.matchtime = 2 -- How long to show matching bracket

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
vim.o.winborder = 'rounded'
-- folding
opt.foldenable = true -- enable fold for nvim-ufo
opt.foldmethod = 'manual' -- Fold based on manual selection.
opt.foldexpr = "nvim_treesitter#foldexpr()" -- Use treesitter for folding
opt.foldlevel = 99 -- set high foldlevel for nvim-ufo
opt.foldlevelstart = 99 -- start with all code unfolded
-- undoing
opt.autoread = true -- Automatically re-read files if unmodified inside 
opt.autowrite = false -- Don't auto save
opt.backspace = { 'indent', 'eol', 'start' } -- Allow backspacing over indention, line breaks and insertion start.
opt.dir = fn.expand('$HOME/.cache/nvim') -- Directory to store backup files.
opt.undodir = fn.expand('$HOME/.cache/nvim/undodir') -- Set undofiles dir
opt.undofile = true -- Set undofiles
opt.confirm = true -- Display a confirmation dialog when closing an unsaved file.
opt.history = 10000 -- Increase the undo limit.
opt.modeline = false -- Ignore file’s mode lines; use vimrc configurations instead.
opt.swapfile = false -- Disable swap files. if string.find(fn.expand('$SHELL'), 'zsh') ~= nil then
if string.find(fn.expand('$SHELL'), 'zsh') ~= nil then
  opt.shell = '/usr/bin/zsh'
elseif string.find(fn.expand('$SHELL'), 'bash') ~= nil then
  opt.shell = '/usr/bin/bash'
else
  opt.shell = fn.expand('$SHELL')
end
opt.spell = true --Enable spellchecking.
opt.spelllang = { 'en_us', 'ru_ru' }
opt.wildignore :append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar", '.pyc', '.swp' }) -- Ignore files matching these patterns when opening files based on a glob pattern.
opt.clipboard = { 'unnamedplus' } -- Copy paste between vim and everything else, 'unnamed'
-- UI and windows
opt.signcolumn = 'yes' -- sets opt.signcolumn to auto
opt.colorcolumn = '80,100,120' -- colored line on characters
opt.termguicolors = true
opt.mouse = 'a' -- Enable your mouse
opt.splitbelow = true -- Horizontal splits will automatically be below
opt.splitright = true -- Vertical splits will automatically be to the right
opt.termguicolors = true -- Support true colors
opt.conceallevel = 0 -- So that I can see `` in markdown files
opt.concealcursor = "" -- Don't hide cursor line markup
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
g.lsp_handlers_enabled = true -- enable or disable default lsp.handlers (hover and signature help)
g.semantic_tokens_enabled = true -- enable or disable LSP semantic tokens on startup
g.git_worktrees = nil -- enable git integration for detached worktrees (specify a table where each entry is of the form { toplevel = env.HOME, gitdir=env.HOME .. "/.dotfiles" })

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
if fn.has 'nvim-0.10' == 1 then
  opt.smoothscroll = true
end
-- Fix markdown indentation settings
g.markdown_recommended_style = 0
-- Performance improvements
opt.redrawtime = 10000
opt.maxmempattern = 20000
opt.lazyredraw = true -- Don't redraw during macros
opt.synmaxcol = 300 -- Syntax highlighting limit
opt.ttimeoutlen = 0 -- Key code timeout

-- NEOVIDE OPTIONS
o.guifont = 'VictorMono Nerd Font:h14'
g.neovide_scale_factor = 1.2
g.neovide_hide_mouse_when_typing = true
g.neovide_cursor_animation_length = 0.0
g.neovide_cursor_vfx_mode = ''

-- TRANSPARENCY
api.nvim_set_hl(0, "Normal", { bg = "none" })
api.nvim_set_hl(0, "NormalNC", { bg = "none" })
api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
