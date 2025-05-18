{
  # define what the flake.nix does
  description = "An experimental devshell for my dev-environments";

  # define the inputs that i will use to define the where to draw the pkgs
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  # what i want the pkgs to do
  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };

    cshells = import ./modules/cshells.nix {inherit pkgs; };
    pyshells = import ./modules/pyshell.nix {inherit pkgs; };
    jsshells = import ./modules/jsshells.nix {inherit pkgs; };

  in {
    devShells = {
      ${system} = {
        # TODO: add a default shell so that direnv stops complaining

        # c/cpp development environments
        gcc = cshells.gcc-shell;
        clang = cshells.clang-shell;

        # python development environments
        pyml = pyshells.pyml;
        pysh = pyshells.pyshell;
        pyfl = pyshells.pyflask;

        # javascript developement environments
        bun = jsshells.bun;
        nodejs_22 = jsshells.nodejs_22;
      };
    };
  };
}
