{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      background_opacity 0.95
      include /home/opituf/.config/kitty/themes/noctalia.conf
    '';
  };
}
