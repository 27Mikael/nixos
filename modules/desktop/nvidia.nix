{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnsupportedSystem = true;

  # NVIDIA closed-source driver
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.production;
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

