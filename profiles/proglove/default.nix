{ pkgs, ... }: {
  # TODO read up on how to structure this
  # is it supposed to be a sub-profile of laptop or graphical?
  # if it stays toplevel, what do I HAVE to import?
  imports = [ ./graphical ];

  services.xserver = {
    #  enable = true;
    displayManager = {
      defaultSession = "none+xmonad";

      # Should be default, but I prefer explicit
      lightdm.enable = true;

      # the lightdm mini-greeter automatically uses the default session
      # This only makes sense in a single user machine, like my work laptop
      # A logical place to put this would be a proglove laptop profile or
      # something user-specific.
      lightdm.greeters.mini = {
        enable = true;
        # TODO how do I solve this more elegantly? Currently, this is an
        # implicit dependency to users/jbl, which feels off.
        user = "jbl";
      };
    };
  };
}
