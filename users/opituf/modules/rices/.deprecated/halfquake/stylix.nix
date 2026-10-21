{ pkgs, ... }:
{
  stylix = {
    enable = true;
    base16Scheme = ./nonix/theme.yaml;
    autoEnable = true;
    targets = {
      noctalia-shell.enable = false;
      alacritty.enable = false;
      yazi.enable = false;
    };
  };
}
