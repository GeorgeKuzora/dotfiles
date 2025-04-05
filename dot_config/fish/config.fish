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
fish_add_path $PATH /home/linuxbrew/.linuxbrew/bin $GOPATH/bin $HOME/.local/bin

# ABBREVIATION
# Colorize grep output (good for log files)
safe_abbr grep 'grep --color=auto'
safe_abbr egrep 'egrep --color=auto'
safe_abbr fgrep 'fgrep --color=auto'
# Easier to read disk
safe_abbr df 'df -h' # human-readable sizes
safe_abbr free 'free -m' # show sizes in MB
# Nvim
safe_abbr vi nvim
safe_abbr vim 'set -gx NVIM_APPNAME nvim; nvim'
safe_abbr vid 'set -gx NVIM_APPNAME defaultvim; nvim'
safe_abbr lazyvim 'set -gx NVIM_APPNAME lazyvim; nvim'
safe_abbr vin neovide
# System
safe_abbr update 'sudo dnf update && sudo snap refresh && flatpak update'
# Git
safe_abbr gst 'git status'
safe_abbr gl 'git log'
safe_abbr ga 'git add'
safe_abbr gc 'git commit'
safe_abbr gcm 'git commit -m'
safe_abbr gP 'git push'
safe_abbr gp 'git pull'
safe_abbr gf 'git fetch'
safe_abbr gb 'git branch'
safe_abbr gco 'git checkout'
safe_abbr gcob 'git checkout -b'
safe_abbr gs "git stash push -m '"
safe_abbr gsa 'git stash apply'
safe_abbr gsp 'git stash pop'
safe_abbr gsd 'git stash drop'
safe_abbr gss 'git stash show'
safe_abbr gsl 'git stash list'
safe_abbr gsb 'git stash branch'
safe_abbr gsc 'git stash clear'
safe_abbr gwta 'git worktree add'
safe_abbr gwtr 'git worktree remove'
safe_abbr gm 'git merge'
safe_abbr gmc 'git merge --continue'
safe_abbr gma 'git merge --abort'
safe_abbr gr 'git rebase'
safe_abbr grc 'git rebase --continue'
safe_abbr gra 'git rebase --abort'
safe_abbr gmomr 'git merge origin/master'
safe_abbr gmomn 'git merge origin/main'
safe_abbr gmod 'git merge origin/dev'
safe_abbr gmos 'git merge origin/staging'
safe_abbr gmot 'git merge origin/test'
# Kubectl
safe_abbr k 'kubectl'
safe_abbr kg 'kubectl get'
safe_abbr kd 'kubectl describe'
safe_abbr kl 'kubectl logs'
safe_abbr kgp 'kubectl get pods'
safe_abbr kdp 'kubectl describe pods'
safe_abbr klp 'kubectl logs pods'
safe_abbr kgd 'kubectl get deployments'
safe_abbr kdd 'kubectl describe deployments'
safe_abbr kld 'kubectl logs deployments'
safe_abbr kgs 'kubectl get services'
safe_abbr kds 'kubectl describe services'
safe_abbr kls 'kubectl logs services'
# Poetry
safe_abbr psh 'poetry shell'
safe_abbr pi 'poetry install'
safe_abbr pl 'poetry lock'
safe_abbr pe 'poetry env'
# Other tools
safe_abbr zj zellij
safe_abbr zja 'zellij a'
safe_abbr zjs 'zellij -s'
safe_abbr lg lazygit
safe_abbr lzg lazygit
safe_abbr lzd lazydocker
safe_abbr ls 'ls --color=auto'
safe_abbr ll 'ls -lavh --ignore=.. --color=auto --group-directories-first' # show long listing of all except ".."
safe_abbr ls 'exa --oneline'
safe_abbr ll 'exa -lah --color=auto --group-directories-first --icons --git --header' # show long listing of all except ".."
safe_abbr cat bat
safe_abbr pyal 'source .venv/bin/activate.fish'
safe_abbr pd prevd
safe_abbr nd nextd
safe_abbr gtask go-task
safe_abbr gotask go-task
safe_abbr got go-task
safe_abbr tsk go-task
safe_abbr ai 'ssh -L 29841:localhost:9841 -p 3389 kuzora@gpu-lana01.well.ftc.ru'
safe_abbr casper 'ssh admin@casper-admin.ml2.dp-k8s-test.ftc.ru -p30023'
safe_abbr y yazi

if status is-interactive
    fzf --fish | source
    atuin init fish | source
    zoxide init fish | source
    direnv hook fish | source
    starship init fish | source
    carapace _carapace | source
    task --completion fish | source
    uv generate-shell-completion fish | source
    uvx --generate-shell-completion fish | source
end
