{config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodePackages.live-server
    nodePackages.npm
    nodejs_22
    node2nix
    yarn
  ];
}
