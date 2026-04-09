{ config, lib, pkgs, ... }:

{
  programs.niri = {
    enable = true;
    # IMPORTANT: use .settings, NOT .config (raw KDL)
    # Stylix injects border colors into .settings — .config would override it
    settings = {
      prefer-no-csd = true;

      input = {
        keyboard.xkb = {
          layout = "us,ru";
          options = "grp:alt_shift_toggle";
        };
        mouse.accel-speed = 0.0;
      };

      layout = {
        gaps = 8;
        focus-ring = {
          enable = true;
          width = 2;
          # Stylix sets active/inactive colors automatically.
          # Override with lib.mkForce if you want manual control:
          # active.color = "#${config.lib.stylix.colors.base0D}ff";
          # inactive.color = "#${config.lib.stylix.colors.base03}ff";
        };
      };

      binds = with config.lib.niri.actions; let
        mod = "Mod"; # Super key
      in {
        "${mod}+Return".action = spawn "alacritty";
        "${mod}+Q".action = close-window;
        "${mod}+F".action = fullscreen-window;

        "${mod}+H".action = focus-column-left;
        "${mod}+L".action = focus-column-right;
        "${mod}+J".action = focus-window-down;
        "${mod}+K".action = focus-window-up;

        "${mod}+Shift+H".action = move-column-left;
        "${mod}+Shift+L".action = move-column-right;
        "${mod}+Shift+J".action = move-window-down;
        "${mod}+Shift+K".action = move-window-up;

        "${mod}+1".action = focus-workspace 1;
        "${mod}+2".action = focus-workspace 2;
        "${mod}+3".action = focus-workspace 3;
        "${mod}+4".action = focus-workspace 4;
        "${mod}+Shift+1".action = move-column-to-workspace 1;
        "${mod}+Shift+2".action = move-column-to-workspace 2;
        "${mod}+Shift+3".action = move-column-to-workspace 3;

        "Print".action.screenshot = {};
        "${mod}+Shift+S".action.screenshot-screen = {};

        "${mod}+Shift+E".action = quit; # exit niri
      };

      # Noctalia shell integration — if noctalia sets up a bar/launcher,
      # it may need to be spawned as a startup program:
      spawn-at-startup = [{ command = [ "noctalia-bar" ]; }];
    };
  };
}
