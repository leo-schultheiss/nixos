let
  pkgs = import <nixpkgs> { };
  azuremlpkgs = import ./.;
  python = pkgs.python3;
  pythonPackages = python.pkgs;
in

with pkgs;


mkShell {
  name = "pip-env";
  buildInputs = with pythonPackages; [
    # Python requirements (enough to get a virtualenv going).
    pandas
    ipykernel
    jupyter
    pytest
    setuptools
    wheel
    venvShellHook
    conda

    libffi
    openssl
    gcc

    unzip
  ];
  venvDir = "venv";
  src = null;
  postVenv = ''
    unset SOURCE_DATE_EPOCH
    ./scripts/install_local_packages.sh
  '';
  shellHook = ''
  (pycharm-professional . &)
  '';
  postShellHook = ''
    # Allow the use of wheels.
    unset SOURCE_DATE_EPOCH
    PYTHONPATH=$PWD/$venvDir/${python.sitePackages}:$PYTHONPATH
  '';
}
