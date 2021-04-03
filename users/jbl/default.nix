{ ... }:
{
  imports = [ ../../profiles/ssh ];

  home-manager.users.nixos = { suites, ... }: {
    imports = suites.base;
  };

  users.users.jbl = {
    uid = 1001;
    password = "nixos";
    description = "Julius Blank";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
