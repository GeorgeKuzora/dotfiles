# XDG paths
XDG_CONFIG_HOME="$HOME/.config"
XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"
# ZSH configuration path
ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Language managment variables /etc/enviroments
# typeset -U PATH path
# export GTK_IM_MODULE='fcitx'
# export QT_IM_MODULE='fcitx'
# export SDL_IM_MODULE='fcitx'
# export XMODIFIERS='@im=fcitx'

# PATH
PATH="$PATH:$HOME/.config/emacs/bin"
PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/.local/share/nautilus-python/extensions"
PATH="$PATH:/opt/pt"
PATH="$PATH:/usr/pgsql-15/bin"
export PATH

# FPATH For docker completions
FPATH="$FPATH:$HOME/.config/zsh/vendor-completions"
# FPATH="$FPATH:/usr/share/zsh/vendor-completions"
export FPATH
# Look manpage via nvim
# export MANPAGER='nvim +Man!'
# export MANWIDTH=999

# ENVIROMENT VARIABLES
export TERM='xterm-256color'
export EDITOR='/usr/bin/nvim'
export VISUAL='/usr/bin/nvim'
export TERMINAL="wezterm"
export BROWSER="firefox"
export VIDEO="mpv"
export PAGER="less"
export SHELL="zsh"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
# export READER="atril"
# export IMAGE="qimgv"
# export COLORTERM="truecolor" # alacritty is 256 color terminal
# export TERM=xterm-256color
# export OPENER="xdg-open"
# export WM="qtile"
# Home folder control
# export XCURSOR_PATH=/usr/share/icons:${XDG_DATA_HOME}/icons
# export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
# export SQLITE_HISTORY="$XDG_CACHE_HOME"/sqlite_history
# export ERRFILE="$XDG_CACHE_HOME/X11/xsession-errors"
