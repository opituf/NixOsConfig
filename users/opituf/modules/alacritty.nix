{
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.95;
      font = {
        size = 13.0;
        normal.family  = "JetBrainsMono Nerd Font";
        normal.style   = "Regular";
        bold.family    = "JetBrainsMono Nerd Font";
        bold.style     = "Bold";
        italic.family  = "JetBrainsMono Nerd Font";
        italic.style   = "Italic";
      };
      colors = {
        primary = {
          background = "#261b26";
          foreground = "#fdd0d0";
        };
        cursor = {
          text = "CellBackground";
          cursor = "#f2706c";
        };
        normal = {
          black   = "#4a2030";
          red     = "#d12a23";
          green   = "#f66151";
          yellow  = "#ff7800";
          blue    = "#e9c2c9";
          magenta = "#c0304a";
          cyan    = "#d97b7b";
          white   = "#f9ece9";
        };
        bright = {
          black   = "#4a2030";
          red     = "#d12a23";
          green   = "#f66151";
          yellow  = "#ff7800";
          blue    = "#e9c2c9";
          magenta = "#c0304a";
          cyan    = "#d97b7b";
          white   = "#f9ece9";
        };
      };
    };
  };
}
