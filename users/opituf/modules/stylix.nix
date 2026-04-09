{
  stylix = {
    enable = true;
    image = "../wallpaper/Teto.jpg";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    targets = {
      alacritty.enable = true;
    };
  };
}
