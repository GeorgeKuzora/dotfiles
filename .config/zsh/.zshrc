# PATH
export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH="$ZDOTDIR/oh-my-zsh"
export GOPATH="$HOME/go"
export PATH="$PATH:$HOME/.local/bin:$GOPATH/bin"
export FPATH="$FPATH:$HOME/.config/zsh/vendor-completions:/usr/share/zsh/vendor-completions"
export MANPATH="/usr/local/man:$MANPATH"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

# ENV VARS
export MANPAGER='nvim +Man!'
export MANWIDTH=999
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
  export VISUAL='vim'
else
  export EDITOR='nvim'
  export VISUAL='nvim'
fi
export TERM='xterm-256color'
export COLORTERM="truecolor"
export TERMINAL="kitty"
export BROWSER="brave-browser"
export VIDEO="mpv"
export PAGER="less"
export SHELL="zsh"
export OPENER="xdg-open"
export READER="evince"
export IMAGE="loupe"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export VI_MODE_SET_CURSOR=true
export ARCHFLAGS="-arch x86_64"

# OH-MY-ZSH CONFIG
ZSH_THEME="robbyrussell"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
         git
         zsh-autosuggestions
         zsh-syntax-highlighting
         history-substring-search
         zsh-vi-mode
         zsh-you-should-use
         poetry
         )

source $ZSH/oh-my-zsh.sh

# PERSONAL CONFIGURATION
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000000
HISTFILESIZE=1000000
HISTCONTROL=ignoredups
SAVEHIST=1000000
setopt autocd
unsetopt beep
bindkey -v
export KEYTIMEOUT=1
zstyle :compinstall filename "$HOME/.config/zsh/.zshrc"
setopt extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef  # Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')
autoload -Uz compinit && compinit -i
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
_comp_options+=(globdots)  # Include hidden files.
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
autoload -Uz colors && colors
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# ALIASES
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB
alias config='/usr/bin/git --git-dir=$HOME/.config/dotfiles/ --work-tree=$HOME'
alias peerflix='peerflix -l -k'
alias brh='br -h'
alias vi='nvim'
alias vim='nvim'
alias vin="neovide"
alias emacs_daemon="emacs --daemon & disown"
alias emacs="emacsclient -c -a -fs 'emacs' & disown"
alias alacritty="env WINIT_UNIX_BACKEND=x11 alacritty"
alias update="sudo dnf upgrade && flatpack update"
alias zj="zellij"
alias zja="zellij a"
alias zjs="zellij -s"
alias lg="lazygit"
alias lzg="lazygit"
alias lzd="lazydocker"
alias pyal="source .venv/bin/activate"
alias cpy='xclip -selection c'
alias h="history 1 | cut -c 8- | sort | uniq | fzf | tr '\\n' ' ' | cpy"
alias vid="NVIM_APPNAME=defaultnvim nvim"
if ! command -v -- "$exa" > /dev/null 2>&1; then
    alias ls='exa --oneline'
    alias ll='exa -lah --color=auto --group-directories-first --icons --git --header'   # show long listing of all except ".."
else
    alias ls='ls --color=auto'
    alias ll='ls -lavh --ignore=.. --color=auto --group-directories-first'   # show long listing of all except ".."
    alias l='ls -lavh --ignore=.?* --color=auto --group-directories-first'   # show long listing but no hidden dotfiles except "."
fi
if ! command -v -- "$bat" > /dev/null 2>&1; then
    alias cat="bat"
fi

# APPS SETUP
source <(fzf --zsh)
eval "$(atuin init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(pyenv init -)"
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
