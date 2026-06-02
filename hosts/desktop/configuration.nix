{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./../../nixos/packages.nix
    ./../../nixos/mainModules/bundle.nix
    ./extraBundle.nix
    ./aliases.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking.hostName = "desktop";

  system.stateVersion = "26.05";
}
