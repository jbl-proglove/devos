{ pkgs, ... }:

{
  # see https://github.com/nix-community/home-manager/blob/master/modules/programs/rofi.nix
  programs.rofi = {
    enable = true;
    plugins = [ pkgs.rofi-calc pkgs.rofi-powermenu ]
      terminal = "${pkgs.alacritty}/bin/alacritty";
    theme = ./theme.rasi;
  };
}
