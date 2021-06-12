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
    extraPackages = haskellPackages: [
      haskellPackages.xmonad-contrib
      haskellPackages.xmonad-extras
      haskellPackages.xmonad
      haskellPackages.xmobar
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
