{ mkDerivation, base, containers, lens, stdenv, text }:
mkDerivation {
  pname = "nix-test";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base containers lens text ];
  license = stdenv.lib.licenses.bsd3;
}
