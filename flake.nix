{
  description = "Personal Nix flake templates";

  outputs =
    { self }: {
      templates = {
        default = self.templates.generic;

        generic = {
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
