{
  # TODO try xdg.configFile."alacritty/alacritty.yml".source = ../../configs/terminal/alacritty.yml;
  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        TERM = "xterm-256color";
        # fix issue with differing font sizes on laptop and external
        # monitors
        WINIT_X11_SCALE_FACTOR = "1";
      };
      window.decorations = "full";

      font = {
        use_thin_strokes = true;
        normal.family = "FuraMono Nerd Font";
        bold.family = "FuraMono Nerd Font";
        italic.family = "FuraMono Nerd Font";
        size = 14.0;
      };
      cursor.style = "Block";
      # INVESTIGATE what makes more sense: set opacity here or in picom?
      bell = {
        animation = "EaseOutExpo";
        duration = 5;
        color = "#aa8888";
      };
      selection.save_to_clipboard = true;

      # snazzy theme
      colors = {
        # Default colors
        primary = {
          background = "0x282a36";
          foreground = "0xeff0eb";
        };

        # Normal colors
        normal = {
          black = "0x282a36";
          red = "0xff5c57";
          green = "0x5af78e";
          yellow = "0xf3f99d";
          blue = "0x57c7ff";
          magenta = "0xff6ac1";
          cyan = "0x9aedfe";
          white = "0xf1f1f0";
        };

        # Bright colors
        bright = {
          black = "0x686868";
          red = "0xff5c57";
          green = "0x5af78e";
          yellow = "0xf3f99d";
          blue = "0x57c7ff";
          magenta = "0xff6ac1";
          cyan = "0x9aedfe";
          white = "0xf1f1f0";
        };
      };
    };
  };
}
