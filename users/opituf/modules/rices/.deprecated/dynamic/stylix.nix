{ pkgs, ... }:
{
  stylix = {
    enable = true;
    polarity = "dark";
    image = ../../../wallpaper/Teto.png;
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/apathy.yaml";
    autoEnable = true;
    targets = {
      noctalia-shell.enable = false;
      alacritty.enable = false;
      yazi.enable = false;
    };
  };
}
