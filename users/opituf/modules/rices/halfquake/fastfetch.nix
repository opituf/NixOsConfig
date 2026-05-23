{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = ./nonix/logo.txt;
        padding.top = 1;
        color = {"1" = "38;2;13;197;29";};
      };
      display = {
        separator = " >) ";
      };
      modules = [
        { type = "title"; }
        { type = "separator"; } 
        { type = "os"; key = "OS"; keyColor = "38;2;0;255;22"; }
        { type = "kernel"; key = "KERNEL"; keyColor = "38;2;0;255;22"; }
        { type = "packages"; key = "PACKAGES"; keyColor = "38;2;0;255;22"; }
        { type = "wm"; key = "WM"; keyColor = "38;2;0;255;22"; }
        { type = "de"; key = "DE"; keyColor = "38;2;0;255;22"; }
        { type = "terminal"; key = "TERMINAL"; keyColor = "38;2;0;255;22"; }
        { type = "shell"; key = "SHELL"; keyColor = "38;2;0;255;22"; }
        { type = "memory"; key = "RAM"; keyColor = "38;2;0;255;22"; } 
        { type = "disk"; key = "DISK"; keyColor = "38;2;0;255;22"; }
        { type = "localip"; key = "IP"; keyColor = "38;2;0;255;22"; }
        { type = "host"; key = "HOST"; keyColor = "38;2;0;255;22"; }
        { type = "display"; key = "DISPLAY"; keyColor = "38;2;0;255;22"; }
        { type = "cpu"; key = "CPU"; keyColor = "38;2;0;255;22"; }
        { type = "gpu"; key = "GPU"; keyColor = "38;2;0;255;22"; }
        { type = "battery"; key = "BATTERY"; keyColor = "38;2;0;255;22"; }
        { type = "poweradapter"; key = "POWER"; keyColor = "38;2;0;255;22"; }
        { type = "locale"; key = "LOCALE"; keyColor = "38;2;0;255;22"; }
        { type = "colors"; }
      ];
    }; 
  };
}
