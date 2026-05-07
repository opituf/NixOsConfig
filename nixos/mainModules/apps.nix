{ config, pkgs, ... }:

{
  programs.firefox.enable = true;
  services.openssh.enable = true;
  services.ratbagd.enable = true; # Для игровых мышей
  services.flatpak.enable = true;

  # Steam
  # Disable x11 window composition to avoid race condition when using xwayland-satellite
  nixpkgs.overlays = [
    (final: prev: {
      steam = prev.steam.override {
        extraArgs = "-cef-disable-gpu-compositing";
      };
    })   
  ];
  
  # then just enable steam as normal
  programs.steam = {
    enable = true;
    protontricks.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}
