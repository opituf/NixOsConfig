{ pkgs, ... }:
{
  stylix = {
    enable = true;
    image = ../wallpaper/Teto.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-dune.yaml";
    autoEnable = true;
    targets = {
      noctalia-shell.enable = false;
      alacritty.enable = false;
    };
  };
}
