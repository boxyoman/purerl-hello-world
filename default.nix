{ pkgs ? import <nixpkgs> {}}:
let
  easy-ps = import (pkgs.fetchFromGitHub {
    owner = "boxyoman";
    repo = "easy-purescript-nix";
    rev = "c9ac929b6d59e846486644f1439c56b9c692896d";
    sha256 = "17v39ra0gf3qys83wi2sk5rgfj7vkicsvza97zp9v18yc4cs6baa";
  });

in pkgs.stdenv.mkDerivation {
  name = "purerl-test";
  buildInputs = builtins.attrValues {
    inherit (easy-ps.inputs)
      purs
      spago;
    erlang = pkgs.erlang;
  };
}
