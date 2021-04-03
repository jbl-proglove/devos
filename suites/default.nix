{ users, profiles, userProfiles, ... }:

{
  system = with profiles; rec {
    workstation = [ develop graphical users.jbl ];
    progloveLaptop = workstation ++ [ laptop ]; # todo add proglove related stuff
    privateLaptop = workstation ++ [ laptop users.noah ];
    base = [ users.nixos users.root ];
  };
  user = with userProfiles; rec {
    base = [ direnv git ];
  };
}
