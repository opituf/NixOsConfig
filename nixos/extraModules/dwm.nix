{ config, pkgs, pkgs-unstable, ... }:
{
  services.xserver.enable = true;
  services.xserver.windowManager.dwm.enable = true;

  imports = [ ./sddm.nix ];
 
  environment.systemPackages = with pkgs; [
    dmenu
    dwmblocks
    xorg.xsetroot
    feh
    dunst
    slock
    st
    xclip
    scrot
    brightnessctl
    pavucontrol
    playerctl
    nsxiv
    zathura
    mpv
    networkmanager_dmenu
    xbanish
    picom
    playerctl
    lxappearance
  ];
}
