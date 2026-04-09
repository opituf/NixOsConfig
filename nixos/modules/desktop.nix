{ config, pkgs, inputs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  # Раскладка клавиатуры
  services.xserver.xkb = {
    layout = "us, ru";
    variant = "";
    options = "grp:alt_shift_toggle";
  };

  # Звук (Pipewire)
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  services.pulseaudio.enable = false;

  # Печать и тачпад
  services.printing.enable = true;
  services.libinput.enable = true;

  # Порталы
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-kde
      pkgs.xdg-desktop-portal-gtk 
    ];
    config = {
      KDE.default = "kde";
      common.degfault = "*";
    };
  };
  
  stylix = {
    enable = true;
  };
}
