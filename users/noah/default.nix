{ ... }:
{
  home-manager.users.nixos = { suites, ... }: {
    imports = suites.base;
  };

  users.users.noah = {
    uid = 1002;
    password = "nixos";
    description = "Noah Blank";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
