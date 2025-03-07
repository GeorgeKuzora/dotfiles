if [ -e /home/kuzora/.nix-profile/etc/profile.d/nix.sh ]; then . /home/kuzora/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
sudo ip link set eth0 mtu 1350
fish -i


# Commands that should be applied only for interactive shells.
[[ $- == *i* ]] || return

HISTFILESIZE=100000
HISTSIZE=10000

shopt -s histappend
shopt -s checkwinsize
shopt -s extglob
shopt -s globstar
shopt -s checkjobs

alias -='cd -'
alias ..='cd ..'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'

if [[ ! -v BASH_COMPLETION_VERSINFO ]]; then
  . "/nix/store/r40zqmfxlvwbg6ap6dn96p3ycqn3yccn-bash-completion-2.16.0/etc/profile.d/bash_completion.sh"
fi

