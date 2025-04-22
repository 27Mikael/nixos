{ config, pkgs, ...}:

{
 environment.systemPackages = with pkgs; [
  gcc
  gnumake
  pkg-config
  ];
}
