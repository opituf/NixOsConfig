{ config, pkgs, ... }:

{
  programs.firefox.enable = true;
  services.openssh.enable = true;
  services.ratbagd.enable = true; # Для игровых мышей
  services.flatpak.enable = true;

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}
