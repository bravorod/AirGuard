{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  buildInputs = [
    pkgs.python39
    pkgs.nodejs-16_x
    pkgs.docker
    pkgs.terraform
  ];
  shellHook = ''
    export PYTHONPATH=$PWD/backend
    export PATH=$PWD/website/node_modules/.bin:$PATH
  '';
}
