{ pkgs, ... }: {
  imports = [ ./xmonad ];

  environment.systemPackages = with pkgs; [
    alacritty
  ];

  services.xserver = {
    enable = true;
    displayManager = {
      defaultSession = "none+xmonad";

      # Should be default, but I prefer explicit
      lightdm.enable = true;
    };
  };
}
