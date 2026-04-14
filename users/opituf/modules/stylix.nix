{ pkgs, ... }:
{
  stylix = {
    enable = true;
    image = ../wallpaper/Teto.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-dune.yaml";
    autoEnable = true;
    targets = {
      alacritty.enable = false;
    };
  };
}
