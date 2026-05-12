{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      font_family      JetBrainsMono Nerd Font
      bold_font        JetBrainsMono Nerd Font Bold
      italic_font      JetBrainsMono Nerd Font Italic
      font_size        13

      background_opacity 0.95

      background #261b26
      foreground #fdd0d0

      cursor_text_color background
      cursor #f2706c

      color0  #4a2030
      color1  #d12a23
      color2  #f66151
      color3  #ff7800
      color4  #e9c2c9
      color5  #c0304a
      color6  #d97b7b
      color7  #f9ece9

      color8  #4a2030
      color9  #d12a23
      color10 #f66151
      color11 #ff7800
      color12 #e9c2c9
      color13 #c0304a
      color14 #d97b7b
      color15 #f9ece9

      allow_remote_control yes
    '';
  };
}
