{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./mainModules/bundle.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking.hostName = "nixos";

  system.stateVersion = "25.11";
}
