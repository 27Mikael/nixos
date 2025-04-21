{
  description = "A very basic flake";

  inputs = {
    # Nixppkgs 
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # Home-manager
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }: @ inputs: let
    inherit (self) outputs;
  in  {
     # nixos configuration entry point
     # 'nixos-rebuild --flake .#hosthame'
     nixosConfigurations = {
      harbinger = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs outputs;};
          # main configuration file  
          modules = [./configuration.nix]; 
      };
    };

    # standalone home-manager entry point
    # 'home-manager --flake .#hosthame@hostname'
    homeConfigurations {
      harbinger = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyharbingeharbinger       
        specialArgs = {inherit inputs outputs;};
        # home-manager configuration file
        modules = [./home.nix];
      };
    };
  };
}
