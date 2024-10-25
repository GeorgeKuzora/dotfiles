{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "georgiy";
  home.homeDirectory = "/home/georgiy";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.lazydocker
    pkgs.obsidian
    pkgs.yazi
    pkgs.direnv
    pkgs.jq
    pkgs.go-task
    pkgs.httpie
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/autostart".source = config.lib.file.mkOutOfStoreSymlink "/home/georgiy/.dotfiles/.config/autostart";
    ".config/Code".source = config.lib.file.mkOutOfStoreSymlink "/home/georgiy/.dotfiles/.config/Code";
    ".config/fish".source = config.lib.file.mkOutOfStoreSymlink "/home/georgiy/.dotfiles/.config/fish";
    ".config/git".source = config.lib.file.mkOutOfStoreSymlink "/home/georgiy/.dotfiles/.config/git";
    ".config/kitty".source = config.lib.file.mkOutOfStoreSymlink "/home/georgiy/.dotfiles/.config/kitty";
    ".config/mpv".source = config.lib.file.mkOutOfStoreSymlink "/home/georgiy/.dotfiles/.config/mpv";
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "/home/georgiy/.dotfiles/.config/nvim";
    ".config/pypoerty".source = config.lib.file.mkOutOfStoreSymlink "/home/georgiy/.dotfiles/.config/pypoerty";
    ".config/starship".source = config.lib.file.mkOutOfStoreSymlink "/home/georgiy/.dotfiles/.config/starship";
    ".config/tmux/tmux.conf".source = config.lib.file.mkOutOfStoreSymlink "/home/georgiy/.dotfiles/.config/tmux/tmux.conf";
    ".config/wezterm".source = config.lib.file.mkOutOfStoreSymlink "/home/georgiy/.dotfiles/.config/wezterm";
    ".config/zed".source = config.lib.file.mkOutOfStoreSymlink "/home/georgiy/.dotfiles/.config/zed";
    ".config/zellij".source = config.lib.file.mkOutOfStoreSymlink "/home/georgiy/.dotfiles/.config/zellij";
    ".config/zsh/.zshrc".source = config.lib.file.mkOutOfStoreSymlink "/home/georgiy/.dotfiles/.config/zsh/.zshrc";
    ".config/zsh/vendor-completions".source = config.lib.file.mkOutOfStoreSymlink "/home/georgiy/.dotfiles/.config/zsh/vendor-completions";

    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/georgiy/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
