{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        include = "/.config/fuzzel/themes/noctalia";
        dpi-aware = true;
      };
    };
  };
}
