{
  description = "A very basic flake";

  inputs = {
    # Nixppkgs 
    nixpkgs.url = "nixpkgs/nixos-24.11";

    # Home-manager
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
   lib = nixpkgs.lib;
   system = "x86_64-linux";
   pkgs = nixpkgs.legacyPackages.${system};
  in  {
     # nixos configuration entry point
     # 'nixos-rebuild --flake .#hosthame'
     nixosConfigurations = {
      harbinger = lib.nixosSystem {
          inherit system;
          # main configuration file  
          modules = [./configuration.nix]; 
      };
    };

    # standalone home-manager entry point
    # 'home-manager --flake .#hosthame@hostname'
    homeConfigurations = {
      harbinger = home-manager.lib.homeManagerConfiguration {
      	inherit pkgs;
        # home-manager configuration file
        modules = [./home.nix];
      };
    };
  };
}
