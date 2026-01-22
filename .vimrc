" Leader keys
let mapleader = " "
let maplocalleader = " "

" Optimizations
set viewoptions-=curdir " disable saving current directory with views
set shortmess+=IsWc " disable startup message + other optimization
set grepprg=rg\ --vimgrep\ --smart-case\ --follow " Better grep command
set path+=** " include subdirectories in search

" Decrease update time
set updatetime=250
set timeoutlen=300

" Set completeopt to have a better completion experience in insert mode
set completeopt=menu,menuone,preview,noselect

" highlighting and search
set hlsearch " With highlight search
set ignorecase " Search ignoring case of letters
set infercase " infer cases in keyword completion
set smartcase " Search with ignore case if all small and with case if even one is big
set incsearch " Search incrementally when you input request
set wrapscan " Cycle search results until the end and then move to the beginning
set showmatch " Highlight matching brackets
set matchtime=2 " How long to show matching bracket

" indentation
set breakindent " Enable break indent
set autoindent " auto indention
set smartindent " smart indention
set copyindent " copy the previous indentation on autoindenting
set preserveindent
set shiftround " When shifting lines, round the indentation to the nearest multiple of shiftwidth.
set shiftwidth=4 " When shifting, indent using four spaces.
set expandtab " create spaces from tab
set smarttab " Insert "tabstop" number of spaces when the "tab" key is pressed.
set tabstop=4 " Indent using four characters.
set softtabstop=4 " Indent using four spaces.
let g:markdown_recommended_style=0
let g:python_indent = {
      \ 'open_paren': 'shiftwidth()',
      \ 'nested_paren': 'shiftwidth()',
      \ 'continue': 'shiftwidth()',
      \ 'closed_paren_align_last_line': v:true,
      \ 'searchpair_timeout': 150,
      \ 'disable_parentheses_indenting': 0,
      \ }

" lines
set display=lastline " Always try to show a paragraph's last line.
set encoding=utf-8 " Use an encoding that supports unicode.
set fileencoding=utf-8 " The encoding written to file
set nowrap " Disable line wrapping.
set linebreak " Avoid wrapping a line in the middle of a word.
set scrolloff=8 " The number of screen lines to keep above and below the cursor.
set sidescrolloff=5 " The number of screen columns to keep to the left and right of the cursor.
syntax enable " Enable syntax highlighting

" display
set number " Show line numbers on the sidebar.
set norelativenumber " Don't show relative numbers
set laststatus=3 " Always display the status bar.
set ruler " Always show cursor position.
set wildmenu " Display command line's tab complete options as a menu.
set tabpagemax=50 " Maximum number of tab pages that can be opened from the command line.
set noerrorbells " Disable beep on errors.
set visualbell " Flash the screen instead of beeping on errors.
set title " set the window's title, reflecting the file currently being edited.

" Note: vim.o.winborder doesn't exist in Vim, so it's omitted

" folding
set foldenable " enable fold
set foldmethod=manual " Fold based on manual selection.
set foldlevel=99 " set high foldlevel
set foldlevelstart=99 " start with all code unfolded

" Note: foldexpr from treesitter requires treesitter plugin in Vim
" set foldexpr=nvim_treesitter#foldexpr()

" undoing
set autoread " Automatically re-read files if unmodified inside
set noautowrite " Don't auto save
set backspace=indent,eol,start " Allow backspacing over indention, line breaks and insertion start.
set dir=~/.cache/vim " Directory to store backup files.
set undodir=~/.cache/vim/undodir " Set undofiles dir
set undofile " Set undofiles
set confirm " Display a confirmation dialog when closing an unsaved file.
set history=10000 " Increase the undo limit.
set nomodeline " Ignore file's mode lines; use vimrc configurations instead.
set noswapfile " Disable swap files.

" Shell detection
if match($SHELL, 'zsh') != -1
  set shell=/usr/bin/zsh
elseif match($SHELL, 'bash') != -1
  set shell=/usr/bin/bash
else
  set shell=$SHELL
endif

set wildignore+=*.o,*.obj,*.pyc,*.class,*.jar,.pyc,.swp " Ignore files matching these patterns when opening files based on a glob pattern.
set clipboard+=unnamedplus " Copy paste between vim and everything else

" UI and windows
set signcolumn=yes " sets signcolumn to auto
set mouse=a " Enable your mouse
set splitbelow " Horizontal splits will automatically be below
set splitright " Vertical splits will automatically be to the right
set termguicolors " Support true colors (if terminal supports it)
set conceallevel=0 " So that I can see `` in markdown files
set concealcursor= " Don't hide cursor line markup
set cursorline " Enable highlighting of the current line
set nobackup " Disable backup files
set nowritebackup " Disable write backup

" Steady cursors (no blinking at all)
let &t_ti = "\e[2 q"  " Start: steady block cursor
let &t_SI = "\e[6 q"  " Insert mode: steady line cursor
let &t_EI = "\e[2 q"  " Normal mode: steady block cursor
let &t_SR = "\e[4 q"  " Replace mode: steady underline cursor
let &t_te = "\e[0 q"  " Reset on exit

" Automation
set noautochdir " Your working directory will always be the same as your working directory
set nocompatible " 'compatible' is not set
set formatoptions=tcqjronl
set cmdheight=1 " command line minimum high
set pumheight=10 " height of the pop up menu
set virtualedit=block " allow going past end of line in visual block mode

" Plugin/LSP related settings (may require plugins in Vim)
let g:autoformat_enabled = 1 " enable or disable auto formatting at start
let g:cmp_enabled = 1 " enable completion at start
let g:autopairs_enabled = 1 " enable autopairs at start
let g:diagnostics_mode = 3 " set the visibility of diagnostics in the UI
let g:icons_enabled = 1 " disable icons in the UI
let g:ui_notifications_enabled = 1 " disable notifications when toggling UI elements
let g:codelens_enabled = 1 " enable or disable automatic codelens refreshing for lsp that support it
let g:highlighturl_enabled = 1 " highlight URLs by default
let g:inlay_hints_enabled = 0 " enable or disable LSP inlay hints on startup
let g:lsp_handlers_enabled = 1 " enable or disable default lsp.handlers
let g:semantic_tokens_enabled = 1 " enable or disable LSP semantic tokens on startup

" LazyVim style options
set grepformat=%f:%l:%c:%m
set list
set listchars=tab:»\ ,trail:·,nbsp:␣
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions
set noshowmode " Don't show mode since we have a statusline
set wildmode=longest:full,full " Command-line completion mode
set winminwidth=5 " Minimum window width

" Note: fillchars is Vim 9.0+ feature, using older syntax for compatibility
" set fillchars=foldopen:,foldclose:,fold: ,foldsep: ,diff:╱,eob:

" Performance improvements
set redrawtime=10000
set maxmempattern=20000
set lazyredraw " Don't redraw during macros
set synmaxcol=300 " Syntax highlighting limit
set ttimeoutlen=0 " Key code timeout

" Note: Neovide specific options are omitted as they only apply to Neovim GUI
" Note: Transparency settings via nvim_set_hl are omitted as they're Neovim
" specific

" ============================================
" NEOVIM QUALITY OF LIFE IMPROVEMENTS
" ============================================

" Space do nothing in normal, visual, and select modes
nnoremap <Space> <Nop>
vnoremap <Space> <Nop>
xnoremap <Space> <Nop>

" Escape insert mode with ii
inoremap ii <esc>

" Quick spell correction
nnoremap z1 z=1<CR><CR>

" Change word under cursor in a buffer
nnoremap <leader>* :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" ============================================
" INDENTATION CHANGE
" ============================================

" Indent left/right and keep selection
vnoremap < <gv
vnoremap > >gv
xnoremap < <gv
xnoremap > >gv

" ============================================
" MOVING IN BUFFER
" ============================================

" Scroll half down/up and center
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Find next/previous and center
nnoremap n nzzzv
nnoremap N Nzzzv

" Next/previous paragraph and center
nnoremap } }zzzv
nnoremap { {zzzv

" ============================================
" PASTING AND YANKING
" ============================================

" Delete without killing (using blackhole register)
nnoremap <leader>d "_d
vnoremap <leader>d "_d
xnoremap <leader>d "_d

" Change without killing
nnoremap <leader>c "_c
vnoremap <leader>c "_c
xnoremap <leader>c "_c

" Delete until end of line without killing
nnoremap <leader>D "_D
vnoremap <leader>D "_D
xnoremap <leader>D "_D

" Change until end of line without killing
nnoremap <leader>C "_C
vnoremap <leader>C "_C
xnoremap <leader>C "_C

" Delete/change char into void register
nnoremap x "_x
nnoremap s "_s

" ============================================
" WORKING WITH BUFFERS
" ============================================

" New buffer
nnoremap <leader>bn :enew<CR>

" Delete buffer
nnoremap <leader>bd :bdelete<CR>

" ============================================
" WINDOW MANAGEMENT
" ============================================

" Window resizing with Alt key
nnoremap <M--> <C-w>-
nnoremap <M-=> <C-w>+
nnoremap <M-,> <C-w><
nnoremap <M-.> <C-w>>

" ============================================
" INSERT MODE
" ============================================

" Undo-friendly delete in insert mode
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" ============================================
" DIAGNOSTICS
" ============================================

" Note: Vim doesn't have vim.diagnostic by default
" These require Language Server Protocol (LSP) setup
" You'll need plugins like coc.nvim or vim-lsp

" Open floating diagnostic message (requires plugin support)
" nnoremap <leader>ld :call diagnostic#open_float()<CR>

" Open diagnostics list (requires plugin support)
" nnoremap <leader>lD :call diagnostic#setloclist()<CR>

" ============================================
" QUICKFIX
" ============================================

" Open quickfix list
nnoremap <leader>q :copen<CR>

" ============================================
" NVIM UI
" ============================================

" Note: Most of these are Neovim-specific functions
" You'll need equivalent Vimscript functions or plugins

" Toggle diagnostics mode (requires custom function or plugin)
" nnoremap <leader>ud :call ToggleDiagnostics()<CR>

" Toggle diagnostics visibility (requires custom function or plugin)
" nnoremap <leader>ut :call ToggleDiagnosticsVisibility()<CR>

" Hide diagnostic decorations (requires LSP plugin)
" nnoremap <leader>ue :call diagnostic#hide()<CR>

" Toggle diagnostic (requires LSP plugin)
" nnoremap <leader>uD :call diagnostic#toggle()<CR>

" Toggle wrap
nnoremap <leader>uw :set wrap!<CR>

" Show file in xdg-open (Linux specific)
nnoremap <leader>uo :!xdg-open %<CR>

" Set file as executable
nnoremap <leader>ux :!chmod +x %<CR>

" Escape highlight search
nnoremap <leader>un :noh<CR>

" Copy full file path (requires custom function)
" nnoremap <leader>uy :call CopyFilePath()<CR>

" Here's a simple implementation for CopyFilePath:
function! CopyFilePath()
    let @+ = expand("%:p")
    echo "Copied file path: " . expand("%:p")
endfunction
nnoremap <leader>uy :call CopyFilePath()<CR>

" ============================================
" TABS
" ============================================

" Create new tab
nnoremap <leader>an :tabnew<CR>

" Close current tab
nnoremap <leader>ac :tabclose<CR>

" Close all other tabs
nnoremap <leader>ao :tabonly<CR>

" Go to previous tab
nnoremap <leader>ah :tabprevious<CR>

" Go to next tab
nnoremap <leader>al :tabnext<CR>
