{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;

  # Настройки фаервола и VPN
  networking.firewall.checkReversePath = "loose";
  services.resolved.enable = true;
  services.zerotierone.enable = true;

  # Модули ядра для сети
  boot.initrd = {
    supportedFilesystems = [ "nfs" ];
    kernelModules = [ "nfs" ];
  };
  boot.kernelModules = [ "tun" ];
}
