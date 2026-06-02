{ config, pkgs, ... }:
{
  services.xserver = {
    enable = true;
    desktopManager.xfce.enable = true;
  };

  imports = [ ./sddm.nix ];

  systemd.user.services.polkit-gnome = {
    description = "Polkit GNOME agent";
    wantedBy = [ "graphical-session.target" ];
    serviceConfig.ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  };

  services.upower.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.xfce.default = [ "gtk" ];
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    blueman  
    xfce.xfce4-power-manager
    xfce.xfce4-pulseaudio-plugin
  ];
}
