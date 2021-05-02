{ ... }:
{
  imports = [ ../../profiles/ssh ];

  home-manager.users.jbl = { suites, ... }: {
    imports = suites.coding;

    programs.git = {
      userName = "Julius Blank";
      userEmail = "julius.blank@proglove.de";
    };
  };

  users.users.jbl = {
    uid = 1001;
    password = "nixos";
    description = "Julius Blank";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
