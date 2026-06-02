{ config, pkgs, ... }:
{
  services.desktopManager.plasma6.enable = true;
  imports = [ ./sddm.nix ];
  
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
    config.kde.default = [ "kde" ];
  };
}
