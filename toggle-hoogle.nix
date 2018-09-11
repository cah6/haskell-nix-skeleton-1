{
  # Library of functions to use, for composeExtensions. 
  lib ? (import <nixpkgs> {}).pkgs.lib
  # Whether or not hoogle should be enabled.
, withHoogle
  # Input set of all haskell packages. A valid input would be:
  # (import <nixpkgs> {}).pkgs.haskellPackages
, input
}:
if withHoogle
  then  input.override (old: {
          overrides = lib.composeExtensions (old.overrides or (_: _: {})) (self: super: {
            ghc = super.ghc // { withPackages = super.ghc.withHoogle; };
            ghcWithPackages = self.ghc.withPackages;
          });
        })
  else  input