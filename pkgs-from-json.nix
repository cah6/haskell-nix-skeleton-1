# Takes the json output of nix-prefetch-git utility and returns nixpkgs for that
# commit.
{
  bootstrap ? import <nixpkgs> {}
, json
}:
let 
  nixpkgs = builtins.fromJSON (builtins.readFile json);
  src = bootstrap.fetchFromGitHub {
    owner = "NixOS";
    repo  = "nixpkgs-channels";
    inherit (nixpkgs) rev sha256;
  };
in 
  import src {} 