{
  description = "My system configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
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
        specialArgs = { inherit pkgs-unstable inputs system; };
        modules = [ ./nixos/configuration.nix ];
      };

      homeConfigurations.${userName} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = { inherit pkgs-unstable; };
        modules = [ ./users/opituf/home.nix ];
      };
    };
}
