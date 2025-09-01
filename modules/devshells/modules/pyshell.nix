{ pkgs }:

let
  libstdcxx = pkgs.stdenv.cc.cc.lib;
  python = pkgs.python312Full;

  basepkgs = with pkgs; [
    python
    libstdcxx
    virtualenv
    playwright-driver.browsers

    python312Packages.requests
    python312Packages.ipython
    python312Packages.typer
    python312Packages.rich
    python312Packages.pip
  ];
in {
  pyshell = pkgs.mkShell {
    name = "pyshell";
    buildInputs = basepkgs;
    shellHook = ''
      export LD_LIBRARY_PATH=${pkgs.stdenv.cc.cc.lib}/lib:${pkgs.zstd}/lib:$LD_LIBRARY_PATH
      echo "🐍 General Python 3.12 Dev Shell Loaded"
      if [ -f .env/bin/activate ]; then
        source .env/bin/activate
      fi
    '';
  };

  pyflask = pkgs.mkShell {
    name = "pyflask";
    buildInputs = basepkgs ++ (with pkgs; [ python312Packages.flask ]);
    shellHook = ''
      export LD_LIBRARY_PATH=${libstdcxx}/lib:$LD_LIBRARY_PATH
      echo "🌐 Flask Webdev Python Shell Loaded"
      if [ -f .env/bin/activate ]; then
        source .env/bin/activate
      fi
    '';
  };

  pyml = pkgs.mkShell {
    name = "pyml";
    buildInputs = basepkgs ++ (with pkgs; [
      python312Packages.scikit-learn
      python312Packages.torchvision
      python312Packages.matplotlib
      python312Packages.jupyterlab
      python312Packages.notebook
      python312Packages.opencv4
      python312Packages.pytorch
      python312Packages.seaborn
      python312Packages.pandas
      python312Packages.numpy
    ]);
    shellHook = ''
      export LD_LIBRARY_PATH=${libstdcxx}/lib:$LD_LIBRARY_PATH
      echo "🧠 Machine Learning Python Shell Loaded"
      if [ -f .env/bin/activate ]; then
        source .env/bin/activate
      fi
    '';
  };
}

