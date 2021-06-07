{ suites, pkgs, ... }:
{
  ### root password is empty by default ###
  imports = suites.base;

  environment.variables.NIXPKGS_ALLOW_BROKEN = "1";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  fileSystems."/" = { device = "/dev/disk/by-label/nixos"; };
}
