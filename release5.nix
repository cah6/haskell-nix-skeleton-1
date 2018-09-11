let
  pinnedPkgs = import ./pkgs-from-json.nix { json = ./nixos-18-09.json; };

  customHaskellPackages = pinnedPkgs.haskellPackages.override (old: {
    overrides = pinnedPkgs.lib.composeExtensions (old.overrides or (_: _: {})) (self: super: {
      project1 = self.callPackage ./default.nix { };
      # additional overrides go here
    });
  });

in
  { project1 = customHaskellPackages.project1;
  }