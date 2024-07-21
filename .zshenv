# XDG paths
XDG_CONFIG_HOME="$HOME/.config"

# ZSH configuration path
ZDOTDIR="$XDG_CONFIG_HOME/zsh"
. $ZDOTDIR/.zshenv

if [ -e /home/georgiy/.nix-profile/etc/profile.d/nix.sh ]; then . /home/georgiy/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

. "$HOME/.atuin/bin/env"
