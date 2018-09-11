let
  pinnedPkgs = import ./pkgs-from-json.nix { json = ./nixos-18-03.json; };
in
  { project1 = pinnedPkgs.haskellPackages.callPackage ./default.nix { };
  }