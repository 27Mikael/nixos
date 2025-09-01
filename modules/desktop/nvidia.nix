{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnsupportedSystem = true;

  # NVIDIA closed-source driver
  hardware.nvidia = {
    package = pkgs.linuxPackages.nvidia_x11;
    open = false; # closed-source for GTX 1050
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  # CUDA packages (optional)
  environment.systemPackages = with pkgs; [
    cudaPackages.cudatoolkit
    cudaPackages.nccl
  ];

  # Blacklist Nouveau
  boot.blacklistedKernelModules = [ "nouveau" ];
}

