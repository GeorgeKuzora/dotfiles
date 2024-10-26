{ config, pkgs, ... }:
let
  username = "kuzora";
  home = "/home/kuzora";
in {
  nixpkgs.config.allowUnfree = true;
  news.display = "silent";

  home = {
    username = "${username}";
    homeDirectory = "${home}";
    stateVersion = "24.05";

    packages = [
      pkgs.lazydocker
      pkgs.yazi
      pkgs.direnv
      pkgs.jq
      pkgs.go-task
      pkgs.httpie
      pkgs.atuin
      pkgs.bat
      pkgs.delta
      pkgs.fd
      pkgs.fzf
      pkgs.go
      pkgs.lazygit
      pkgs.lua
      pkgs.luajitPackages.luarocks
      pkgs.neovim
      pkgs.nodejs
      pkgs.ripgrep
      pkgs.starship
      pkgs.stow
      pkgs.unzip
      pkgs.xclip
      pkgs.zoxide
      pkgs.eza
      pkgs.fish
      pkgs.werf
      pkgs.tldr
      (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      # (pkgs.writeShellScriptBin "my-hello" ''
      #   echo "Hello, ${config.home.username}!"
      # '')
    ];

    file = {
      ".config/atuin".source = config.lib.file.mkOutOfStoreSymlink "${home}/.dotfiles/.config/atuin";
      ".config/autostart".source = config.lib.file.mkOutOfStoreSymlink "${home}/.dotfiles/.config/autostart";

      ".config/Code/User/snippets".source = config.lib.file.mkOutOfStoreSymlink "${home}/.dotfiles/.config/Code/User/snippets";
      ".config/Code/User/init.lua".source = config.lib.file.mkOutOfStoreSymlink "${home}/.dotfiles/.config/Code/User/init.lua";
      ".config/Code/User/settings.json".source = config.lib.file.mkOutOfStoreSymlink "${home}/.dotfiles/.config/Code/User/settings.json";
      ".config/Code/User/keybindings.json".source = config.lib.file.mkOutOfStoreSymlink "${home}/.dotfiles/.config/Code/User/keybindings.json";

      ".config/fish".source = config.lib.file.mkOutOfStoreSymlink "${home}/.dotfiles/.config/fish";
      ".config/git".source = config.lib.file.mkOutOfStoreSymlink "${home}/.dotfiles/.config/git";
      ".config/kitty".source = config.lib.file.mkOutOfStoreSymlink "${home}/.dotfiles/.config/kitty";
      ".config/mpv".source = config.lib.file.mkOutOfStoreSymlink "${home}/.dotfiles/.config/mpv";
      ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${home}/.dotfiles/.config/nvim";
      ".config/pypoerty".source = config.lib.file.mkOutOfStoreSymlink "${home}/.dotfiles/.config/pypoetry";
      ".config/starship".source = config.lib.file.mkOutOfStoreSymlink "${home}/.dotfiles/.config/starship";
      ".config/tmux/tmux.conf".source = config.lib.file.mkOutOfStoreSymlink "${home}/.dotfiles/.config/tmux/tmux.conf";
      ".config/wezterm".source = config.lib.file.mkOutOfStoreSymlink "${home}/.dotfiles/.config/wezterm";
      ".config/zed".source = config.lib.file.mkOutOfStoreSymlink "${home}/.dotfiles/.config/zed";
      ".config/zellij".source = config.lib.file.mkOutOfStoreSymlink "${home}/.dotfiles/.config/zellij";

      ".config/zsh/.zshrc".source = config.lib.file.mkOutOfStoreSymlink "${home}/.dotfiles/.config/zsh/.zshrc";
      ".config/zsh/vendor-completions".source = config.lib.file.mkOutOfStoreSymlink "${home}/.dotfiles/.config/zsh/vendor-completions";
      ".zshenv".source = config.lib.file.mkOutOfStoreSymlink "${home}/.dotfiles/.zshenv";
    };
    sessionVariables = {
      # EDITOR = "emacs";
    };
  };
  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;
    bash = {
      enable = true;
      bashrcExtra = ''
        if [ -e /home/kuzora/.nix-profile/etc/profile.d/nix.sh ]; then . /home/kuzora/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
        sudo ip link set eth0 mtu 1350
        fish -i
      '';
      shellAliases = {
        ll = "ls -alF";
        la = "ls -A";
        l = "ls -CF";
        ".." = "cd ..";
        "-" = "cd -";
      };
    };
  };
}
