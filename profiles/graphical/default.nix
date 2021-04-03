{ pkgs, ... }: {
  imports = [ ./xmonad ];

  services.xserver = {
    enable = true;
    displayManager.lightdm.greeters.mini = {
      enable = true;
      user = "jbl";
    };
  };
}
