{ pkgs, ... }: {
  # TODO verify
  imports = [ ./zsh ./kakoune ./tmux ];

  environment.shellAliases = { v = "$EDITOR"; pass = "gopass"; };

  environment.sessionVariables = {
    PAGER = "less";
    LESS = "-iFJMRWX -z-4 -x4";
    LESSOPEN = "|${pkgs.lesspipe}/bin/lesspipe.sh %s";
    EDITOR = "vim";
    VISUAL = "vim";
  };

  environment.systemPackages = with pkgs; [
    clang
    file
    git-crypt
    gnupg
    less
    ncdu
    gopass
    tig
    tokei
    wget
    vim
  ];

  fonts =
    let
      nerdfonts = pkgs.nerdfonts.override {
        fonts = [ "DejaVuSansMono" ];
      };
    in
    {
      fonts = [ nerdfonts ];
      fontconfig.defaultFonts.monospace =
        [ "DejaVu Sans Mono Nerd Font Complete Mono" ];
    };

  documentation.dev.enable = true;

  programs.thefuck.enable = true;
  programs.firejail.enable = true;
  programs.mtr.enable = true;
}
