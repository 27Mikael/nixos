{
  inputs = {
    # Nixppkgs
    nixpkgs.url = "nixpkgs/nixos-24.11";

    # Home-manager
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # NVF
    nvf.url = "github:notashelf/nvf";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      # nixos configuration entry point
      # 'nixos-rebuild switch --flake .#hosthame'
      nixosConfigurations = {
        harbinger = lib.nixosSystem {
          inherit system;
          # main configuration file
          modules = [ ./hosts/laptop/configuration.nix ];
        };
      };

      # Stand-alone home-manager entry point
      # run using 'home-manager -f /etc/nixos/home-manager/home.nix switch'
      homeConfigurations = {
        harbinger = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          # home-manager configuration file
          modules = [ ./home-manager/home.nix ];
        };
      };
    };
}
