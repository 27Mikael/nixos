{ pkgs }:

{
  nodejs_22 = pkgs.mkShell {
    name = "nodejs_22";
    buildInputs = with pkgs; [
      nodejs_22
      (yarn.override { nodejs = nodejs_22; })
      nodePackages.live-server
      nodePackages.vercel
      nodePackages.npm
      node2nix
    ];
  };

  bun = pkgs.mkShell {
    name = "bun";
    buildInputs = with pkgs; [
      bun
    ];
  };
}
