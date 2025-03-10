{
  description = "Fedora system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {
    packages.x86_64-linux.default = pkgs.hello; 
    devShells.x86_64-linux.default = pkgs.mkShell {
      buildInputs = [ pkgs.cowsay pkgs.fish ];
    };
  };
}
