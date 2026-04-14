{
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.95;
      font = {
        size = 13.0;
      };
      colors = {
        primary = {
          background = "#261f20";
          foreground = "#ba7e8b";
        };
        cursor = {
          text = "CellBackground";
          cursor = "#783444";
        };
        normal = {
          black   = "#786f76";
          red     = "#81717a";
          green   = "#f6f7f7";
          yellow  = "#9d3037";
          blue    = "#998890";
          magenta = "#bfbdbd";
          cyan    = "#e8e0e1";
          white   = "#c05554";
        };
        bright = {
          black   = "#786f76";
          red     = "#81717a";
          green   = "#f6f7f7";
          yellow  = "#9d3037";
          blue    = "#998890";
          magenta = "#bfbdbd";
          cyan    = "#e8e0e1";
          white   = "#c05554";
        };
      };
    };
  };
}
