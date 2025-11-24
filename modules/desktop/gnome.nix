{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Exclude GNOME apps (top-level packages only)
  environment.gnome.excludePackages = [
    # pkgs.baobab
    pkgs.cheese
    pkgs.eog
    pkgs.epiphany
    # pkgs.gedit
    pkgs.simple-scan
    # pkgs.totem
    pkgs.yelp
    pkgs.evince
    pkgs.file-roller
    pkgs.geary
    pkgs.seahorse

    # All these are ALSO top-level now:
    pkgs.gnome-clocks
    pkgs.gnome-contacts
    pkgs.gnome-font-viewer
    pkgs.gnome-screenshot

    # gnome-connections is also top-level:
    pkgs.gnome-connections
  ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "za";
    variant = "";
  };

  # Extra GNOME extensions
  environment.systemPackages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.open-bar 
    gnome-disk-utility
  ];
}

