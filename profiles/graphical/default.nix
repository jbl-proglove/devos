{ pkgs, ... }: {
  imports = [ ./qutebrowser ./xmonad ./im ];

  hardware.opengl.enable = true;
  # TODO verify setting
  hardware.opengl.driSupport = true;
  hardware.pulseaudio.enable = true;

  # TODO verify settings
  boot = {
    tmpOnTmpfs = true;

    kernel.sysctl."kernel.sysrq" = 1;

  };

  environment.systemPackages = with pkgs; [
    # TODO not sure if this is the right place
    alacritty
    # TODO verify and select packages for XMonad
    dzen2 # used by xmonad/scripts/stoggle
    feh
    ffmpeg-full
    imagemagick
    imlib2
    librsvg
    libsForQt5.qtstyleplugins
    manpages
    #    papirus-icon-theme
    pulsemixer
    qt5.qtgraphicaleffects
    #    sddm-chili
    stdmanpages
    xsel
    zathura
  ];

  # TODO should this be an overlay? A package? I need to learn stuff...
  environment.etc = {
    "wallpapers/nixos_wallpaper_1.png".source = ../../assets/images/nixos_wallpaper_1.png;
  };

  # TODO what does xbanish do?
  services.xbanish.enable = true;

  services.xserver = {
    enable = true;
    displayManager = {
      defaultSession = "none+xmonad";

      # Should be default, but I prefer explicit
      lightdm.enable = true;
    };
  };
}
