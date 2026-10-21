{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = ./assets/logo.txt;
        padding.top = 1;
        color = {"1" = "38;2;255;255;255";};
      };
      display = {
        separator = " > ";
      };
      modules = [
        { type = "title"; }
        { type = "separator"; } 
        { type = "os"; key = "OS"; keyColor = "38;2;255;255;255"; }
        { type = "kernel"; key = "KERNEL"; keyColor = "38;2;255;255;255"; }
        { type = "packages"; key = "PACKAGES"; keyColor = "38;2;255;255;255"; }
        { type = "wm"; key = "WM"; keyColor = "38;2;255;255;255"; }
        { type = "de"; key = "DE"; keyColor = "38;2;255;255;255"; }
        { type = "terminal"; key = "TERMINAL"; keyColor = "38;2;255;255;255"; }
        { type = "shell"; key = "SHELL"; keyColor = "38;2;255;255;255"; }
        { type = "memory"; key = "RAM"; keyColor = "38;2;255;255;255"; } 
        { type = "disk"; key = "DISK"; keyColor = "38;2;255;255;255"; }
        { type = "localip"; key = "IP"; keyColor = "38;2;255;255;255"; }
        { type = "host"; key = "HOST"; keyColor = "38;2;255;255;255"; }
        { type = "display"; key = "DISPLAY"; keyColor = "38;2;255;255;255"; }
        { type = "cpu"; key = "CPU"; keyColor = "38;2;255;255;255"; }
        { type = "gpu"; key = "GPU"; keyColor = "38;2;255;255;255"; }
        { type = "battery"; key = "BATTERY"; keyColor = "38;2;255;255;255"; }
        { type = "poweradapter"; key = "POWER"; keyColor = "38;2;255;255;255"; }
        { type = "locale"; key = "LOCALE"; keyColor = "38;2;255;255;255"; }
        { type = "colors"; }
      ];
    }; 
  };
}
