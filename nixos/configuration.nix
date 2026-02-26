{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./modules/bundle.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking.hostName = "nixos";

  # Это значение менять нельзя, оно фиксирует версию состояния системы
  system.stateVersion = "25.11";
}
