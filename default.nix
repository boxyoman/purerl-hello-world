{ pkgs ? import <nixpkgs> {}}:
let
  easy-ps = import (pkgs.fetchFromGitHub {
    owner = "boxyoman";
    repo = "easy-purescript-nix";
    rev = "277cf5ca7dc07616b8d74225c11f88d22a7f816f";
    sha256 = "14jxabqzfh1d4ja4bnxc1zqpjcjm155rvgnn83ckb0047r4n9a7b";
  });

in pkgs.stdenv.mkDerivation {
  name = "purerl-test";
  buildInputs = [
    easy-ps.inputs.purs
    easy-ps.inputs.spago
    pkgs.erlang
  ];
}
