{
  description = "Home Manager configuration of georgiy";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ghostty = {
      url = "github:ghostty-org/ghostty";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      # ghostty = ghostty.packages.${system};
    in {
      homeConfigurations."georgiy" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        # inherit ghostty;
        modules = [ ./home.nix ];
      };
      homeConfigurations."wsl-work" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./work-wsl.nix ];
      };
      homeConfigurations."wsl-home" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home-wsl.nix ];
      };
    };
}
