{ pkgs }:

let
  basepkgs = with pkgs; [
    # python3 stuff
    python313Full
    virtualenv

    #python313 packages
    python313Packages.requests
    python313Packages.ipython
    python313Packages.typer
    python313Packages.rich
  ];

in {
  # TODO: flask framework based devnev
  # TODO: django framework based devenv
  # TODO: machinge learning based devenv
  pyshell = pkgs.mkShell {
    name = "pyshell";
    buildInputs = basepkgs;
    shellHook = ''
      echo "🐍 General Python Dev Shell Loaded"
    '';
  };

  pyflask = pkgs.mkShell {
    name = "pyflask";
    buildInputs = basepkgs ++ (with pkgs; [ python313Packages.flask ]);
    shellHook = ''
      echo "Webdev Python Shell Loaded"
    '';
  };

  pyml = pkgs.mkShell {
    name = "pyml";
    buildInputs = basepkgs ++ (with pkgs; [
      python313Packages.scikit-learn
      python313Packages.torchvision
      python313Packages.matplotlib
      #python313Packages.tensorflow
      python313Packages.jupyterlab
      python313Packages.notebook
      python313Packages.opencv4
      python313Packages.pytorch
      python313Packages.seaborn
      python313Packages.pandas
      python313Packages.numpy
    ]);
    shellHook = ''
      echo "🧠 Machine Learning Python Shell Loaded"
    '';
  };
}
