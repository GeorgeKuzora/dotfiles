{
  description = "WSL profile flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.default = nixpkgs.legacyPackages.x87_64-linux; [
        atuin
        bat
        delta
        fd
        fzf
        go
        lazygit
        lua
        luajitPackages.luarocks
        neovim
        nodejs
        ripgrep
        starship
        stow
        unzip
        xclip
        zoxide
        eza
        lazydocker
        yazi
        jq
        direnv
        fish
        werf
        go-task
        httpie
        tldr
    ];
  };
}

