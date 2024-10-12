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

# ALIASES
# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB
# nvim to vim
alias vi='nvim'
alias vim='nvim'
alias vin='neovide'
# system
alias update='sudo dnf upgrade && sudo snap refresh && flatpack update'
#tools
alias zj='zellij'
alias zja='zellij a'
alias zjs='zellij -s'
alias lg='lazygit'
alias lzg='lazygit'
alias lzd='lazydocker'
# history fuzzy find
alias cpy='xclip -selection c'
alias h="history 1 | cut -c 8- | sort | uniq | fzf | tr '\\n' ' ' | cpy"
# Modern versions of classic tools
if type -q exa; and type -q bat
    alias ls='exa --oneline'
    alias ll='exa -lah --color=auto --group-directories-first --icons --git --header'   # show long listing of all except ".."
    alias cat='bat'
else
    alias ls='ls --color=auto'
    alias ll='ls -lavh --ignore=.. --color=auto --group-directories-first'   # show long listing of all except ".."
    alias l='ls -lavh --ignore=.?* --color=auto --group-directories-first'   # show long listing but no hidden dotfiles except "."
end


if status is-interactive
    atuin init fish | source
    fzf --fish | source
    zoxide init --cmd cd fish | source
    pyenv init - | source
    starship init fish | source
end

