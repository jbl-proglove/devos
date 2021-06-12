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
    "wallpapers/nix-wallpaper-stripes.png".source = ../../assets/images/nix-wallpaper-stripes.png;
    "wallpapers/nix-wallpaper-mosaic-blue.png".source = ../../assets/images/nix-wallpaper-mosaic-blue.png;
    "wallpapers/nix-wallpaper-nineish-dark-gray.png".source = ../../assets/images/nix-wallpaper-nineish-dark-gray.png;
    "wallpapers/nix-wallpaper-simple-blue.png".source = ../../assets/images/nix-wallpaper-simple-blue.png;
    "wallpapers/wallpaper-desert.png".source = ../../assets/images/wallpaper-desert.png;
    "wallpapers/wallpaper-darth-vader.png".source = ../../assets/images/wallpaper-darth-vader.png;
    "wallpapers/wallpaper-light-rain.jpg".source = ../../assets/images/wallpaper-light-rain.jpg;
  };

  # ANSWERED: what does xbanish do? - it hides the mouse cursor when
  # typing starts.
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
