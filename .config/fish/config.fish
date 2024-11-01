# OPTIONS
set fish_greeting # disable greeting on startup
set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense'

# KEYBINDINGS
set -g fish_key_bindings fish_hybrid_key_bindings

# CURSOR BEHAVIOR
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
set fish_cursor_external line
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
safe_abbr grep 'grep --color=auto'
safe_abbr egrep 'egrep --color=auto'
safe_abbr fgrep 'fgrep --color=auto'
# easier to read disk
safe_abbr df 'df -h'     # human-readable sizes
safe_abbr free 'free -m' # show sizes in MB
# nvim to vim
safe_abbr vi nvim
safe_abbr vim nvim
safe_abbr vin neovide
# system
safe_abbr update 'sudo dnf upgrade && sudo snap refresh && flatpack update'
# Git
safe_abbr gst 'git status'
safe_abbr gl 'git log'
safe_abbr ga 'git add'
safe_abbr gc 'git commit'
safe_abbr gP 'git push'
safe_abbr gp 'git pull'
safe_abbr gf 'git fetch'
safe_abbr gco 'git checkout'
safe_abbr gcb 'git checkout -b'
safe_abbr gwta 'git worktree add'
safe_abbr gwtr 'git worktree remove'
# Other tools
safe_abbr zj 'zellij'
safe_abbr zja 'zellij a'
safe_abbr zjs 'zellij -s'
safe_abbr lg 'lazygit'
safe_abbr lzg 'lazygit'
safe_abbr lzd 'lazydocker'
safe_abbr ls 'ls --color=auto'
safe_abbr ll 'ls -lavh --ignore=.. --color=auto --group-directories-first'   # show long listing of all except ".."
safe_abbr l 'ls -lavh --ignore=.?* --color=auto --group-directories-first'   # show long listing but no hidden dotfiles except "."
safe_abbr ls 'exa --oneline'
safe_abbr ll 'exa -lah --color=auto --group-directories-first --icons --git --header'   # show long listing of all except ".."
safe_abbr cat 'bat'
safe_abbr pyal 'source .venv/bin/activate.fish'


if status is-interactive
    fzf --fish | source
    atuin init fish | source
    zoxide init fish | source
    pyenv init - | source
    direnv hook fish | source
    starship init fish | source
    carapace _carapace | source
end

