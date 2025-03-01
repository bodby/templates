{
  description = "Generic Nix flake";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs =
    { self, nixpkgs, ... }:
    let
      pname = "dummy";
      version = "1.0.0";
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];

      forall = nixpkgs.lib.genAttrs systems;
    in {
      packages = forall (system:
        let
          pkgs = import nixpkgs { inherit system; };
          inherit (pkgs) lib stdenv;
        in {
          default = stdenv.mkDerivation {
            inherit pname version;
            src = ./.;
          };
        });

      devShells = forall (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in {
          default = pkgs.mkShell {
            packages = [ ];
            inputsFrom = [ self.packages.${system}.default ];
          };
        });
    };
}
