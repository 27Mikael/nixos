{ pkgs }:

let
  basepkgs = with pkgs; [
    # TUI/GUI libs
    libxkbcommon
    qtcreator
    gt5.full
    qttools
    ncurses

    # general libs
    nlohmann_json
    valgrind
    cmake
    boost
    conan
    gtest
    gdb
    fmt
  ];
in {
  gcc-shell = pkgs.mkShell {
    name = "gcc-shell";
    buildInputs = basepkgs ++ (with pkgs; [ gcc ]);
    shellHook = ''
      export CC=gcc
      export CXX=g++
      echo "GCC-based C++ environment"
    '';
  };

  clang-shell = pkgs.mkShell {
    name = "clang-shell";
    buildInputs = basepkgs ++ (with pkgs; [ clang ]);
    shellHook = ''
      export CC=clang
      export CXX=clang++
      echo "Clang-based C++ environment"
    '';
  };
}

