{
  description = "Fedora system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.default = nixpkgs.legacyPackages.x87_64-linux; [
      clockify
      dart
      eza
      kubectl
      lazydocker
      monophony
      nix
      obsidian
    ];
  };
}
