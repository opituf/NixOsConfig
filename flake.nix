{
  description = "My system configuration";

  inputs = {

    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-25.11";
    };
 
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    stylix = {
      url = "github:nix-community/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, home-manager, niri, noctalia, stylix, ... }:

    let
      system = "x86_64-linux";
      userName = "opituf";
      hostName = "nixos";
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };

    in {
      nixosConfigurations.${hostName} = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs pkgs-unstable; };
        modules = [ ./nixos/configuration.nix ];
      };

      homeConfigurations.${userName} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = { inherit inputs; };
        modules = [ 
          ./users/opituf/home.nix
          stylix.homeManagerModules.stylix
          niri.homeModules.niri
          noctalia.homeModules.default
        ];
      };
    };
}
