{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    farbfeld
    imgurbash2
    maim
    libnotify
    haskellPackages.xmobar
    xclip
    xorg.xdpyinfo
    xss-lock
  ];

  environment.etc = {
    "xmobar/xmobarrc".source = ./_xmobar.hs;
  };

  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    #    haskellPackages = pkgs.haskellPackages.extend(
    #      pkgs.haskell.lib.packageSourceOverrides {
    #        xmonad = pkgs.fetchFromGitHub {
    #          owner = "xmonad";
    #          repo = "xmonad";
    #          rev = "6a7eb85e84ddc2091706fbce5ff293e859481e51";
    #          sha256 = "mHc46yf/gjGW+55Yui4UR0u8zFjgDWfOLTJKBABQmoo=";
    #        };
    #        xmonad-contrib = pkgs.fetchFromGitHub {
    #          owner = "xmonad";
    #          repo = "xmonad-contrib";
    #          rev = "5067164d195a899a9e63547e94891919e97e0b74";
    #          sha256 = "ZoN7Ue1QMpF8BuZZU9p4FaKV7EsCj83R45Rb55+cqdo=";
    #        };
    #        X11 = pkgs.fetchFromGitHub {
    #          owner = "xmonad";
    #          repo = "X11";
    #          rev = "46bc48c08b0d1f4f682e6730983f789883f4db78";
    #          sha256 = "Lnt6RK+Ef/dOIlu7g0Fob9719VEuAZlwgtQ5dgCZWxI=";
    #        };
    #      }
    #    );
    extraPackages = haskellPackages: [
      haskellPackages.xmonad-contrib
      haskellPackages.xmonad-extras
      haskellPackages.xmonad
      haskellPackages.xmobar
      #      haskellPackages.X11
      # needed by the xmobar Volume command
      haskellPackages.alsa-core
      haskellPackages.alsa-mixer
    ];
    config = import ./xmonad.hs.nix { inherit pkgs; };
  };

  services.picom = {
    enable = true;
    # TODO exclude browser, rofi, screen locker, what else?
    activeOpacity = 0.9;
    inactiveOpacity = 0.5;
    # INVESTIGATE pro? con?
    backend = "glx";
    fade = true;
    fadeDelta = 3;
    # https://btwiusegentoo.github.io/nixconfig/#org49aacba mentions
    # setting services.picom.blur and .extraOptions.
    # It took me a painful while to find out that these are home-manager
    # settings... the following way sets the picom config using a
    # `normal` way ie without home-manager.
    settings = {
      unredir-if-possible = true;
      focus-exclude = "name = 'slock'";
      blur = {
        method = "dual_kawase";
        strength = 5;
      };
      vsync = true;
    };
    experimentalBackends = true;
    shadow = true;
    shadowOpacity = 0.9;
    # not sure if this is needed / better...
  };

  # TODO Evaluate and setup this in xorg.conf or find an alternative - maybe
  # by skipping the display manager
  #
  # Section "ServerFlags"
  #   Option "DontVTSwitch" "True"
  #   Option "DontZap"      "True"
  # EndSection

  # TODO setup some suspend functionality with a nice keybinding.
  # One example, taken from man slock:
  # $ slock /usr/sbin/s2ram
  programs.slock.enable = true;
}
