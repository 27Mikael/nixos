{ pkgs ? import <nixpkgs> { } }:

let
  inherit (pkgs) stdenv lib openssl zlib;

  # build inputs
  baseBuildInputs = with pkgs; [ python312 python312Packages.pip gcc gnumake ];

  baseLDenv = {

    NIX_LD = lib.fileContents "${stdenv.cc}/nix-support/dynamic-linker";
    NIX_LD_LIBRARY_PATH = lib.makeLibraryPath [ stdenv.cc.cc.lib openssl zlib ];
  };
in {
  python = pkgs.mkShell {
    buildInputs = baseBuildInputs;

    shellHook = ''
      echo "Python312 dev shell"
    '';

    # LD paths
    inherit (baseLDenv) NIX_LD NIX_LD_LIBRARY_PATH;
  };

  flask = pkgs.mkShell {
    buildInputs = baseBuildInputs
      ++ (with pkgs; [ python312Packages.flask python312Packages.fastapi ]);

    inherit (baseLDenv) NIX_LD NIX_LD_LIBRARY_PATH;

  };

  insight = pkgs.mkShell {
    buildInputs = baseBuildInputs ++ (with pkgs.python312Packages; [
      scikit-learn
      statsmodels
      matplotlib
      jupyterlab
      ipykernel
      notebook
      jupytext
      pandas
      numpy
    ]);

    inherit (baseLDenv) NIX_LD NIX_LD_LIBRARY_PATH;
  };
}

