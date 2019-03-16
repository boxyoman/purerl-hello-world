{ pkgs ? import <nixpkgs> {}}:
let
  easy-ps = import (pkgs.fetchFromGitHub {
    owner = "boxyoman";
    repo = "easy-purescript-nix";
    rev = "6bdccdcba26504d3ba2bf1f878a75056291b37bf";
    sha256 = "1kypfb2kp6gl2bg1zgj7mkmwqzgf130mmzvr8smlxwn8w3bhwz0h";
  });

in pkgs.stdenv.mkDerivation {
  name = "purerl-test";
  buildInputs = [
    easy-ps.inputs.purs
    easy-ps.inputs.spago
    pkgs.erlang
  ];
}
