let
  pinnedPkgs = import ./pkgs-from-json.nix { json = ./nixos-18-03.json; };
in
  { project1 = pinnedPkgs.haskell.packages.ghc843.callPackage ./default.nix { };
  }