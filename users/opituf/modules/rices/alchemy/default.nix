{ pkgs, lib, ... }:

let
  myDwm = pkgs.dwm.override {
    conf = ./config.h;
  };

  myDwmblocks = import ./dwmblocks { inherit pkgs; };
in
{
  home.packages = [
    myDwm
    myDwmblocks
    pkgs.brightnessctl
    pkgs.wireplumber
  ];

  imports = [./additionals/bundle.nix];
  
  home.sessionPath = [ "$HOME/.local/bin" ];

  # скрипты в PATH
  home.file.".local/bin".source = ./dwmblocks/scripts;

  xsession = {
    enable = true;
    windowManager.command = "${myDwm}/bin/dwm";
    initExtra = ''
      ${pkgs.feh}/bin/feh --bg-fill $HOME/.dotfiles/users/opituf/wallpaper/alc.png &
      ${pkgs.picom}/bin/picom --daemon &
      pkill -x dwmblocks 2>/dev/null || true
      ${myDwmblocks}/bin/dwmblocks &
      ${pkgs.dunst}/bin/dunst &
      ${pkgs.xbanish}/bin/xbanish &
    '';
  };
  # в default.nix райса
  services.picom = {
    enable = true;
    settings = {
      backend = "glx";
      vsync = true;
      opacity-rule = [
        "90:class_g = 'kitty'"
        "85:class_g = 'Code'"
        # и т.д.
      ];
    };
  };
}
