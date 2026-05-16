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
         background = "#101010";
         foreground = "#ebeade";
        };
        cursor = {
          text = "CellBackground";
          cursor = "#00ff16";
        };
        normal = {
          black = "#2b2b2b";
          red = "#00ff16";
          green = "#088513";
          yellow = "#8e8e8e";
          blue = "#686868";
          magenta = "#b9b9b9";
          cyan = "#0dc51d";
          white = "#ffffff"; 
        };
        bright = {
          black = "#2b2b2b";
          red = "#00ff16";
          green = "#088513";
          yellow = "#8e8e8e";
          blue = "#686868";
          magenta = "#b9b9b9";
          cyan = "#0dc51d";
          white = "#ffffff";
        };
      };
    };
  };
}
