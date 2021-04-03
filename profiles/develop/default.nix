{ pkgs, ... }: {
  # TODO imports

  # TODO needed?
  # environment.shellAliases = { v = "$EDITOR"; pass = "gopass"; };

  environment.sessionVariables = {
    # PAGER = "bat";
    LESS = "-iFJMRWX -z-4 -x4";
    # LESSOPEN = "|${pkgs.lesspipe}/bin/lesspipe.sh %s";
    EDITOR = "vim";
    # VISUAL = "vim";
  };

  environment.systemPackages = with pkgs; [
    vim
  ];
}
