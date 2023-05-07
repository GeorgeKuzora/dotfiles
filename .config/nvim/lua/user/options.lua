-- set vim options here (vim.<first_key>.<second_key> = value)
vim.cmd[[set keymap=russian-jcukenwin]]
vim.cmd[[set iminsert=0]]
vim.cmd[[set imsearch=0]]
vim.cmd[[highlight lCursor guifg=NONE guibg=cyan]]
return {
  opt = {
-- highlihting and search
    hlsearch = true,         -- With highlight search
    ignorecase = true,       -- Search ignoring case of letters
    smartcase = true,       -- Search with ignor case if all small and with case if even one is big
    incsearch = true,        -- Search incrementaly when you input request
    wrapscan = true,         -- Cycle search results until the end and then move to the beginning
-- indentation
    autoindent = true,       -- auto indention
    smartindent = true,      -- smart indention
    expandtab = true,        -- create spaces from tab
    shiftround = true,       -- When shifting lines, round the indentation to the nearest multiple of shiftwidth.
    -- shiftwidth = 4,          -- When shifting, indent using four spaces.
    smarttab = true,         -- Insert “tabstop” number of spaces when the “tab” key is pressed.
    -- tabstop = 4,             -- Indent using four characters.
    -- softtabstop = 4,         -- Indent using four spaces.
-- lines
    display = 'lastline',    -- Always try to show a paragraph’s last line.
    encoding = 'utf-8',      -- Use an encoding that supports unicode.
    fileencoding = 'utf-8',  -- The encoding written to file
    wrap = false,             -- Enable line wrapping.
    linebreak = true,        -- Avoid wrapping a line in the middle of a word.
    scrolloff = 8,           -- The number of screen lines to keep above and below the cursor.
    sidescrolloff = 5,       -- The number of screen columns to keep to the left and right of the cursor.
    syntax = 'enable',       -- Enable syntax higlihting
-- display
    number = true,           -- Show line numbers on the sidebar.
    relativenumber = true,   -- Show line number on the current line and relative numbers on all other lines.
    laststatus = 2,          -- Always display the status bar.
    ruler = true,            -- Always show cursor position.
    wildmenu = true,         -- Display command line’s tab complete options as a menu.
    tabpagemax = 50,         -- Maximum number of tab pages that can be opened from the command line.
    errorbells = false,      -- Disable beep on errors.
    visualbell = true,       -- Flash the screen instead of beeping on errors.
    title = true,            -- set the window’s title, reflecting the file currently being edited.
-- folding
    foldmethod = 'indent',   -- Fold based on indention levels.
    foldnestmax = 3,         -- Only fold up to three nested levels.
    foldenable = true,      -- Enable folding by default.
-- undoing
    autoread = true,            -- Automatically re-read files if unmodified inside Vim.
    backspace = {'indent', 'eol', 'start'},  -- Allow backspacing over indention, line breaks and insertion start.
    dir = '/home/georgiy/.cache/nvim',  -- Directory to store backup files.
    undodir = '/home/georgiy/.cache/nvim/undodir',   -- Set undofiles dir
    undofile = true,         -- Set undofiles
    swapfile = false,          -- Set swapfile
    confirm = true,          -- Display a confirmation dialog when closing an unsaved file.
    hidden = true,           -- Hide files in the background instead of closing them.
    history = 10000,          -- Increase the undo limit.
    modeline = false,        -- Ignore file’s mode lines; use vimrc configurations instead.
    swapfile = false,        -- Disable swap files.
    shell = '/usr/bin/zsh',
    spell = false,            --Enable spellchecking.
    wildignore = {'.pyc', '.swp'},   -- Ignore files matching these patterns when opening files based on a glob pattern.
-- Colored colum
    signcolumn = "yes", -- sets vim.opt.signcolumn to auto
    colorcolumn = '80',      -- colored line on 80 charachters
-- UI and windows
    mouse = 'a',             -- Enable your mouse
    splitbelow = true,       -- Horizontal splits will automatically be below
    splitright =true,        -- Vertical splits will automatically be to the right
    termguicolors = true,   -- Support true colors
    conceallevel = 0,        -- So that I can see `` in markdown files
    cursorline = true,        -- Enable highlighting of the current line
    backup = false,            -- This is recommended by coc
    writebackup = false,       -- This is recommended by coc
-- automation
    clipboard = {'unnamedplus'},  -- Copy paste between vim and everything else, 'unnamed'
    autochdir = false,       -- Your working directory will always be the same as your working directory
    cp = false,              -- 'compatible' is not set
    formatoptions = "tcqj" .. "ro",
  },
  g = {
    mapleader = " ", -- sets vim.g.mapleader
    maplocalleader = " ", -- sets vim.g.mapleader
    autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true, -- enable completion at start
    autopairs_enabled = true, -- enable autopairs at start
    diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
  },
}
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end
