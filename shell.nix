{ pkgs ? import <nixpkgs> {} }:
with pkgs;

mkShell {
  buildInputs = [
    python39
    python39Packages.poetry
    python39Packages.black
    python39Packages.isort
    nodejs-16_x
    yarn

    docker
    docker-compose
    terraform
    awscli2
    kubectl
    helm

    git
    jq
    vim
  ];

  shellHook = ''
    # project paths
    export PYTHONPATH=$PWD/backend
    export PATH=$PWD/website/node_modules/.bin:$PATH

    alias tf='terraform'
    alias dc='docker-compose'
    alias up='docker-compose up'
    alias down='docker-compose down'

    if [ -f pyproject.toml ]; then
      poetry shell &> /dev/null || true
    fi
  '';
}
