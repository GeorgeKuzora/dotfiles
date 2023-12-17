# ZSH CONFIGURATION PATH
ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# PATH
PATH="$PATH:$HOME/.config/emacs/bin"
PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/.local/share/nautilus-python/extensions"
PATH="$PATH:/opt/pt"
PATH="$PATH:/usr/pgsql-15/bin"
export PATH

# FPATH FOR COMPLETIONS
FPATH="$FPATH:$HOME/.config/zsh/vendor-completions"
FPATH="$FPATH:/usr/share/zsh/vendor-completions"
export FPATH

# LOOK MANPAGE VIA NVIM
export MANPAGER='nvim +Man!'
export MANWIDTH=999

# ENVIROMENT VARIABLES
EDITOR='/usr/bin/nvim'
VISUAL='/usr/bin/nvim'
TERM='xterm-256color'
COLORTERM="truecolor"
TERMINAL="kitty"
BROWSER="brave-browser"
VIDEO="mpv"
PAGER="less"
SHELL="zsh"
OPENER="xdg-open"
READER="evince"
IMAGE="loupe"
STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

export VI_MODE_SET_CURSOR=true
# FCITX LANGUAGE MANAGEMENT VARIABLES /etc/enviroments
# typeset -U PATH path
# export GTK_IM_MODULE='fcitx'
# export QT_IM_MODULE='fcitx'
# export SDL_IM_MODULE='fcitx'
# export XMODIFIERS='@im=fcitx'
