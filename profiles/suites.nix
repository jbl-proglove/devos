{ users, profiles, userProfiles, ... }:

{
  system = with profiles; rec {

    # base suite
    base = [ core users.jbl users.root ];

    # basic suite with a graphical frontend and a base setup
    workstation = base ++ [ develop graphical ];

    # suite for my work laptop. Most notable is the single-user and more security
    progloveLaptop = workstation ++ [ laptop proglove tailscale ]; # todo add proglove related stuff

    # suite for a private laptop. More fun, less secure, and multi-user.
    privateLaptop = workstation ++ [ laptop users.noah ];
  };

  user = with userProfiles; rec {
    base = [ direnv git alacritty ];

    coding = base ++ [ vscode-with-extensions ];
  };
}
