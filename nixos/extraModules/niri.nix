{ pkgs, inputs, pkgs-unstable, lib, ... }:
{
  programs.niri.enable = true;

  imports = [ ./sddm.nix ];
  services.displayManager.sddm.wayland.enable = lib.mkForce true;

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    grim
    slurp
    swappy
    wl-clipboard
    swaybg
    pkgs-unstable.noctalia-shell
    imv
    fuzzel
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
    config.niri = {
      default = [ "gnome" "gtk" ];
      "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
      "org.freedesktop.impl.portal.Screenshot" = [ "gnome" ];
    };
  };
}
