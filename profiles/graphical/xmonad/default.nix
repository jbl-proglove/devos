{ pkgs, ... }: {
  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    # config = import ./xmonad.hs.nix { inherit pkgs; };
    config = ''
      import XMonad

      main = xmonad defaultConfig
        { modMask = mod4Mask -- Use Super instead of Alt
        , terminal = "alacritty"
        -- more changes
        }

    ''
      };

    services.picom = {
      enable = true;
      inactiveOpacity = 0.8;
      settings = {
        "unredir-if-possible" = true;
        "focus-exclude" = "name = 'slock'";
      };
    };

    programs.slock.enable = true;
  }
