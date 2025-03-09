{
  description = "Personal Nix flake templates";

  outputs =
    { ... }: {
      templates = {
        default = {
          path = ./generic;
          description = "Basic flake";
        };

        latex = {
          path = ./latex;
          description = "LaTeX article";
        };

        # TODO
        # haskell = {
        #   path = ./haskell;
        #   description = "Haskell using Cabal";
        # };
      };
    };
}
