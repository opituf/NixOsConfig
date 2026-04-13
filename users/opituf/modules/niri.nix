{ config, lib, pkgs, ... }:

let
  terminal = "alacritty";
  noctalia  = "noctalia";
  grim      = "grim";
  slurp     = "slurp";
  swappy    = "$swappy";
  wlCopy    = "$wl-copy";
  wlPaste   = "$wl-paste";
  amixer    = "$amixer";

in
{
  programs.niri = {
    enable = true;

    # IMPORTANT: use .settings, NOT .config (raw KDL string).
    # Stylix injects border colors into .settings — .config would override them.
    settings = {
      prefer-no-csd = true;

      # ── Input ──────────────────────────────────────────────────────────────
      input = {
        focus-follows-mouse.enable = true;

        keyboard = {
          xkb = {
            layout  = "us,ru";
            options = "grp:alt_shift_toggle,caps:escape";
          };
          repeat-rate  = 40;
          repeat-delay = 250;
        };

        touchpad = {
          natural-scroll = true;
          tap            = true;
        };

        mouse.accel-profile = "flat";
      };

      # ── Layout ────────────────────────────────────────────────────────────
      layout = {
        gaps = 3;

        focus-ring = {
          enable = true;
          width  = 2;
          # Stylix sets active / inactive colors automatically via the niri target.
          # Uncomment to override:
          # active.color   = "#${config.lib.stylix.colors.base09}ff";
          # inactive.color = "#${config.lib.stylix.colors.base03}ff";
        };
      };

      # ── XWayland ─────────────────────────────────────────────────────────
      xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

      # ── Startup ───────────────────────────────────────────────────────────
      # swaybg is only needed if stylix's niri wallpaper target is disabled;
      # if stylix handles the wallpaper you can remove that entry.
      spawn-at-startup = [
        { command = [ "noctalia-shell" ]; }
      ];

      # ── Keybinds ──────────────────────────────────────────────────────────
      binds = with config.lib.niri.actions; let
        sh = cmd: spawn "sh" "-c" cmd;
        mod = "Mod";
      in {
        # Terminal & basics
        "${mod}+T".action       = spawn terminal;
        "${mod}+Q".action       = close-window;
        "${mod}+G".action       = maximize-column;
        "${mod}+F".action       = fullscreen-window;
        "${mod}+Shift+G".action = toggle-window-floating;
        "${mod}+C".action       = center-column;

        # Focus movement
        "${mod}+Left".action  = focus-column-left;
        "${mod}+Right".action = focus-column-right;
        "${mod}+Up".action    = focus-window-up;
        "${mod}+Down".action  = focus-window-down;

        # Window / column movement
        "${mod}+Shift+Left".action = move-column-left;
        "${mod}+Shift+Right".action = move-column-right;
        "${mod}+Shift+Up".action = move-window-up;
        "${mod}+Shift+Down".action = move-window-down;

        # Workspace focus
        "${mod}+1".action.focus-workspace = 1;
        "${mod}+2".action.focus-workspace = 2;
        "${mod}+3".action.focus-workspace = 3;
        "${mod}+4".action.focus-workspace = 4;
        "${mod}+5".action.focus-workspace = 5;
        "${mod}+6".action.focus-workspace = 6;
        "${mod}+7".action.focus-workspace = 7;
        "${mod}+8".action.focus-workspace = 8;
        "${mod}+9".action.focus-workspace = 9;
        "${mod}+0".action.focus-workspace = 10;

        "${mod}+Shift+1".action.move-column-to-workspace = 1;
        "${mod}+Shift+2".action.move-column-to-workspace = 2;
        "${mod}+Shift+3".action.move-column-to-workspace = 3;
        "${mod}+Shift+4".action.move-column-to-workspace = 4;
        "${mod}+Shift+5".action.move-column-to-workspace = 5;
        "${mod}+Shift+6".action.move-column-to-workspace = 6;
        "${mod}+Shift+7".action.move-column-to-workspace = 7;
        "${mod}+Shift+8".action.move-column-to-workspace = 8;
        "${mod}+Shift+9".action.move-column-to-workspace = 9;
        "${mod}+Shift+0".action.move-column-to-workspace = 10;

        # Resize
        "${mod}+A".action = set-column-width "-5%";
        "${mod}+D".action = set-column-width "+5%";
        "${mod}+W".action = set-window-height "-5%";
        "${mod}+S".action = set-window-height "+5%";

        # Scroll to navigate columns / workspaces
        "${mod}+WheelScrollDown".action      = focus-column-left;
        "${mod}+WheelScrollUp".action        = focus-column-right;
        "${mod}+Ctrl+WheelScrollDown".action = focus-workspace-down;
        "${mod}+Ctrl+WheelScrollUp".action   = focus-workspace-up;

        # Noctalia launcher
        "${mod}+N".action = sh "${noctalia} ipc call launcher toggle";

        # Microphone toggle
        "${mod}+V".action = sh "${amixer} sset Capture toggle";

        # Volume
        "XF86AudioRaiseVolume".action = sh "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+";
        "XF86AudioLowerVolume".action = sh "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-";

        # Screenshots
        # Full-screen → clipboard
        "${mod}+Ctrl+S".action = sh "${grim} -l 0 - | ${wlCopy}";

        # Region select → clipboard
        "${mod}+Shift+S".action = sh "${grim} -g \"$(${slurp} -w 0)\" - | ${wlCopy}";

        # Clipboard → swappy (annotate)
        "${mod}+Shift+E".action = sh "${wlPaste} | ${swappy} -f -";

        # App launcher menu — Mod+D opens quick-launch binds.
        # The original used a custom which-key popup; replicate here as direct binds.
        # Replace with your preferred launcher (rofi, fuzzel, etc.) if desired.
        "${mod}+B".action      = spawn "firefox";
        "${mod}+Ctrl+K".action = spawn "pavucontrol";
        "${mod}+Z".action      = spawn "fuzzel";
      };
    };
  };
}
