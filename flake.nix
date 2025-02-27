{
  description = "Personal Nix flake templates";

  outputs =
    { self }: {
      templates = {
        defaultTemplate = self.templates.generic;

        generic = {
          path = ./generic;
          description = "Basic flake";
        };

        # TODO: Use pkgs.texliveFull or texlive.combine { }.
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
