{ pkgs ? import <nixpkgs> {}}:
with pkgs;
let
  af-blinka = ps: ps.callPackage ./customPackages/adafruit-blinka.nix {};
  python-with-my-packages = python38.withPackages( ps: with ps; [
    adafruit-pureio
    (af-blinka ps)
  ]);
in
  pkgs.mkShell {
    buildInputs = [
      python-with-my-packages
    ];
    shellHook = ''
      PYTHONPATH=${python-with-my-packages}/${python-with-my-packages.sitePackages}
    '';
  }