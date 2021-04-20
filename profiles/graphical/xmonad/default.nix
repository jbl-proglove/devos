{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    farbfeld
    xss-lock
    imgurbash2
    maim
    xclip
    xorg.xdpyinfo
  ];

  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    config = import ./xmonad.hs.nix { inherit pkgs; };
  };

  services.picom = {
    enable = true;
    activeOpacity = 0.9;
    inactiveOpacity = 0.7;
    # INVESTIGATE pro? con?
    backend = "glx";
    fade = true;
    fadeDelta = 5;
    shadow = true;
    shadowOpacity = 0.75;
    settings = {
      "unredir-if-possible" = true;
      "focus-exclude" = "name = 'slock'";
    };
  };

  programs.slock.enable = true;
}
