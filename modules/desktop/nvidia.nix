{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnsupportedSystem = true;

  # NVIDIA closed-source driver
  hardware.nvidia = {
    package = pkgs.nvidiaPackages.production_570;
    open = false; # closed-source for GTX 1050
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  # CUDA packages (optional)
  environment.systemPackages = with pkgs; [
    nvidia_x11.bin
    nvidia-settings
    cudaPackages.cudatoolkit
    cudaPackages.nccl
  ];

  # Blacklist Nouveau
  boot.blacklistedKernelModules = [ "nouveau" ];
}

