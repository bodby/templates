{
  description = "LaTeX flake";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs =
    { nixpkgs, ... }:
    let
      name = "pdf";
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forall = nixpkgs.lib.genAttrs systems;
    in {
      packages = forall (system:
        let
          pkgs = import nixpkgs { inherit system; };
          inherit (pkgs) stdenv;
        in {
          default = stdenv.mkDerivation {
            inherit name;
            src = ./.;

            buildInputs = [ pkgs.texliveFull ];

            buildPhase = ''
              mkdir -p .cache/latex
              latexmk -interaction=nonstopmode -auxdir=.cache/latex -pdf main.tex
            '';

            installPhase = ''
              mkdir -p $out
              cp main.pdf $out
            '';
          };
        });

      devShells = forall (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in {
          default = pkgs.mkShell {
            packages = [ pkgs.texliveFull ];
          };
        });
    };
}
