{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;  # or fish/bash if you use those

    settings = {
      mgr = {
        ratio = [ 1 3 4 ];
        sort_by = "alphabetical";
        sort_sensitive = false;
        sort_reverse = false;
        sort_dir_first = true;
        linemode = "size";
        show_hidden = false;
        show_symlink = true;
      };
      preview = {
        tab_size = 2;
        max_width = 1000;
        max_height = 1000;
        image_delay = 30;
      };
      opener = {
        edit = [
          { run = ''nano "%s"''; block = true; desc = "nano"; }
        ];
        open = [
          { run = ''xdg-open "%s"''; desc = "Open"; }
        ];
        reveal = [
          { run = ''xdg-open "$(dirname "$0")"''; desc = "Reveal"; }
        ];
        extract = [
          { run = ''7z x "%s1" -o"%s1_extracted"''; desc = "Extract here"; }
        ];
        play = [
          { run = ''mpv "%s"''; orphan = true; desc = "mpv"; }
        ];
        image = [
          { run = ''feh "%s"''; orphan = true; desc = "nsxiv"; }
        ];
        pdf = [
          { run = ''zathura %s''; orphan = true; desc = "zathura"; for = "unix"; }
        ];
      };
      open = {
        rules = [
          { mime = "text/*"; use = [ "edit" "reveal" ]; }
          { mime = "image/*"; use = [ "image" "reveal" ]; }
          { mime = "video/*"; use = [ "play" "reveal" ]; }
          { mime = "audio/*"; use = [ "play" "reveal" ]; }
          { mime = "application/pdf"; use = [ "pdf" "reveal" ]; }
          { url  = "*.pdf"; use = [ "pdf" "reveal" ]; }
          { mime = "application/zip"; use = [ "extract" "reveal" ]; }
          { mime = "application/x-tar"; use = [ "extract" "reveal" ]; }
          { mime = "inode/directory"; use = [ "open" "reveal" ]; }
          { url = "*/"; use = [ "edit" "reveal" ]; }
          { url = "*"; use = [ "edit" "reveal" ]; }
        ];
      };
    };

    theme = {
      mgr = {
        cwd = { fg = "#B6BAC8"; };
        hovered = { fg = "#0F1014"; bg = "#7C829D"; };
        preview_hovered = { underline = true; };
        find_keyword = { fg = "#D3D5DE"; bold = true; };
        find_position = { fg = "#E2E4ED"; bg = "#131317"; bold = true; };
        marker_copied = { fg = "#626983"; bg = "#626983"; };
        marker_cut = { fg = "#999EB2"; bg = "#999EB2"; };
        marker_selected = { fg = "#7C829D"; bg = "#7C829D"; };
        tab_active = { fg = "#0F1014"; bg = "#7C829D"; };
        tab_inactive = { fg = "#868690"; bg = "#131317"; };
        tab_width = 1;
        border_symbol = "│";
        border_style = { fg = "#43444D"; };
      };
      status = {
        separator_open = "";
        separator_close = "";
        separator_style = { fg = "#575861"; bg = "#575861"; };
        mode_normal = { fg = "#0F1014"; bg = "#7C829D"; bold = true; };
        mode_select = { fg = "#0F1014"; bg = "#626983"; bold = true; };
        mode_unset = { fg = "#0F1014"; bg = "#999EB2"; bold = true; };
        progress_label = { bold = true; };
        progress_normal = { fg = "#7C829D"; bg = "#131317"; };
        progress_error = { fg = "#999EB2"; bg = "#131317"; };
        permissions_t = { fg = "#7C829D"; };
        permissions_r = { fg = "#D3D5DE"; };
        permissions_w = { fg = "#999EB2"; };
        permissions_x = { fg = "#626983"; };
        permissions_s = { fg = "#E2E4ED"; };
      };
      input = {
        border = { fg = "#7C829D"; };
        title = {};
        value = {};
        selected = { reversed = true; };
      };
      select = {
        border = { fg = "#7C829D"; };
        active = { fg = "#E2E4ED"; };
        inactive = {};
      };
      completion = {
        border = { fg = "#7C829D"; };
        active = { bg = "#2e2e2e"; };
        inactive = {};
      };
      tasks = {
        border = { fg = "#7C829D"; };
        title = {};
        hovered = { underline = true; };
      };
      which = {
        mask = { bg = "#131317"; };
        cand = { fg = "#B6BAC8"; };
        rest = { fg = "#575861"; };
        desc = { fg = "#E2E4ED"; };
        separator = "  ";
        separator_style = { fg = "#575861"; };
      };
      help = {
        on = { fg = "#E2E4ED"; };
        run = { fg = "#B6BAC8"; };
        desc = { fg = "#868690"; };
        hovered = { bg = "#2e2e2e"; bold = true; };
        footer = { fg = "#0F1014"; bg = "#868690"; };
      };
      notify = {
        title_info = { fg = "#7C829D"; };
        title_warn = { fg = "#D3D5DE"; };
        title_error = { fg = "#999EB2"; };
      };
      filetype = {
        rules = [
          # Images
          { mime = "image/*"; fg = "#E2E4ED"; }
          # Videos
          { mime = "video/*"; fg = "#999EB2"; }
          { mime = "audio/*"; fg = "#999EB2"; }
          # Archives
          { mime = "application/{zip,rar,7z*,tar,gzip,xz}"; fg = "#D3D5DE"; }
          # Documents
          { mime = "application/{pdf,doc,rtf}"; fg = "#7C829D"; }
          # Empty files
          { mime = "inode/empty"; fg = "#575861"; }
          # Special files
          { url = "*"; is = "orphan"; bg = "#999EB2"; }
          { url = "*"; is = "exec"; fg = "#626983"; }
          # Directories
          { url = "*/"; fg = "#7C829D"; }
        ];
      };

      keymap = {
        mgr.prepend_keymap = [
          {
            on = [ "c" "i" ];          # or whatever chord you like (c + i = “copy inside”)
            run = ''shell --confirm 'cat "$@" | xclip -selection clipboard' '';
            desc = "Copy file content to clipboard (xclip)";
          }
        ];
      };

      icon = {
        prepend_conds = [
          { "if" = "dir"; text = "󰉋"; fg = "#D3D5DE"; }
        ];
        prepend_dirs = [
          { name = "Downloads";   text = ""; fg = "#626983"; }
          { name = "Documents";   text = ""; fg = "#626983"; }
          { name = "Desktop";     text = "󰇄"; fg = "#626983"; }
          { name = "Pictures";    text = ""; fg = "#626983"; }
          { name = "Music";       text = "󰎇"; fg = "#626983"; }
          { name = "Videos";      text = ""; fg = "#626983"; }
          { name = "Public";      text = ""; fg = "#626983"; }
          { name = "Templates";   text = "󰉒"; fg = "#626983"; }
          { name = ".config";     text = ""; fg = "#626983"; }
          { name = ".git";        text = "󰊢"; fg = "#626983"; }
          { name = ".github";     text = "󰊤"; fg = "#626983"; }
          { name = "Challenges";  text = ""; fg = "#626983"; }
          { name = ".dotfiles";   text = ""; fg = "#626983"; }
        ];
      };
    };
  };
}
