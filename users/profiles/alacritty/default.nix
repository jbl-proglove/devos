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

      # themer.dev Dracula theme
      colors = {
        # Default colors
        primary = {
          background = "0x282a36";
          foreground = "0xdadbd7";
        };

        cursor = {
          text = "0x282a36";
          cursor = "0xbd93f9";
        };

        selection = {
          text = "0x282a36";
          background = "0x6272a4";
        };

        # Normal colors
        normal = {
          black = "0x63656c";
          red = "0xff5555";
          green = "0x50fa7b";
          yellow = "0xf1fa8c";
          blue = "0x6272a4";
          magenta = "0xff79c6";
          cyan = "0x8be9fd";
          white = "0xdadbd7";
        };

        # Bright colors
        bright = {
          black = "0x818287";
          red = "0xfe7674";
          green = "0x72fa93";
          yellow = "0xf2faa0";
          blue = "0x808db4";
          magenta = "0xfe92cf";
          cyan = "0xa1ecfb";
          white = "0xf8f8f2";
        };

        # Dim colors
        dim = {
          black = "0x464751";
          red = "0xd44c4f";
          green = "0x48d06d";
          yellow = "0xc9d07b";
          blue = "0x56648e";
          magenta = "0xd469a9";
          cyan = "0x77c3d5";
          white = "0xbdbdbc";
        };
      };
    };
  };
}
