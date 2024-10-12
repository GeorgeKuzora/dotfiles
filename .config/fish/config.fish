set fish_greeting
set -g fish_key_bindings fish_vi_key_bindings
# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line
# Set the replace mode cursors to an underscore
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
# Set the external cursor to a line. The external cursor appears when a command is started.
# The cursor shape takes the value of fish_cursor_default when fish_cursor_external is not specified.
set fish_cursor_external line
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual block
set -g fish_vi_force_cursor 1

# ENV VARIABLES
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx PYENV_ROOT $HOME/.pyenv
set -gx GOPATH $HOME/go
set -gx MANPAGER 'nvim +Man!'
set -gx MANWIDTH 999
set -gx EDITOR $(which nvim)
set -gx VISUAL $(which nvim)
set -gx TERM xterm-256color
set -gx COLORTERM truecolor
set -gx TERMINAL $(which wezterm)
set -gx BROWSER $(which firefox)
set -gx VIDEO $(which mpv)
set -gx PAGER $(which less)
set -gx SHELL $(which fish)
set -gx OPENER $(which xdg-open)
set -gx READER $(which evince)
set -gx IMAGE $(which loupe)
set -gx STARSHIP_CONFIG $XDG_CONFIG_HOME/starship/starship.toml

# PATH
fish_add_path $PYENV_ROOT/bin $PATH $GOPATH/bin $HOME/.local/bin

# ABBREVIATION
# Colorize grep output (good for log files)
abbr -a grep 'grep --color=auto'
abbr -a egrep 'egrep --color=auto'
abbr -a fgrep 'fgrep --color=auto'
# easier to read disk
abbr -a df 'df -h'     # human-readable sizes
abbr -a free 'free -m' # show sizes in MB
# nvim to vim
abbr -a vi 'nvim'
abbr -a vim 'nvim'
abbr -a vin 'neovide'
# system
abbr -a update 'sudo dnf upgrade && sudo snap refresh && flatpack update'
#tools
abbr -a zj 'zellij'
abbr -a zja 'zellij a'
abbr -a zjs 'zellij -s'
abbr -a lg 'lazygit'
abbr -a lzg 'lazygit'
abbr -a lzd 'lazydocker'
# Git
abbr -a gst git status
abbr -a gl git log
abbr -a ga git add
abbr -a gc git commit
abbr -a gP git push
abbr -a gp git pull
abbr -a gf git fetch
abbr -a gco git checkout
abbr -a gcb git checkout -b
abbr -a gwta git worktree add
abbr -a gwtr git worktree remove
# Modern versions of classic tools
if type -q exa; and type -q bat
    abbr -a ls 'exa --oneline'
    abbr -a ll 'exa -lah --color=auto --group-directories-first --icons --git --header'   # show long listing of all except ".."
    abbr -a cat 'bat'
else
    abbr -a ls 'ls --color=auto'
    abbr -a ll 'ls -lavh --ignore=.. --color=auto --group-directories-first'   # show long listing of all except ".."
    abbr -a l 'ls -lavh --ignore=.?* --color=auto --group-directories-first'   # show long listing but no hidden dotfiles except "."
end

if status is-interactive
    atuin init fish | source
    fzf --fish | source
    zoxide init --cmd z fish | source
    pyenv init - | source
    starship init fish | source
end

