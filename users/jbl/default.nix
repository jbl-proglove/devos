{ ... }:
{
  imports = [ ../../profiles/ssh ];

  home-manager.users.jbl = { suites, ... }: {
    imports = suites.coding;

    # setup files in /home/jbl/
    home.file = {
      ".zshrc".text = "# just here to avoid zsh running the setup on every launch...";
      #      "gnupg/gpg-agent.conf".text = ''
      #        pinentry-program ${pkgs.pinentry_curses}/bin/pinentry-curses
      #      '';
    };

    # TODO find a better way to setup gnupg as a (user?) profile
    #    programs.gnupg.agent = {
    #      enable = true;
    #      enableSSHSupport = true;
    #    };

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
