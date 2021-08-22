{ config, pkgs, ... }:
{
  # TODO verify
  imports = [ ./zsh ./vim ./kakoune ./tmux ];

  environment = {
    shellAliases = {
      v = "$EDITOR";
      pass = "gopass";
      # FIXME this should be sth like an alias for running a different
      # command with the last parameter of the previous command
      vv = "v !!$";
    };

    variables.GNUPGHOME = "~/.gnupg";

    sessionVariables = {
      PAGER = "less";
      LESS = "-iFJMRWX -z-4 -x4";
      LESSOPEN = "|${pkgs.lesspipe}/bin/lesspipe.sh %s";
      EDITOR = "vim";
      VISUAL = "vim";
    };

    # TODO include packages based on inspiration by repos:
    # - gvolpe
    # - ...
    systemPackages = with pkgs; [
      # TODO move this to a separate profile for detailed config
      awscli2
      dasel
      clang
      file
      git-crypt
      #(gnupg.override {
      #  pinentry = pkgs.pinentry_curses;
      #  pinentryBinaryPath = "/run/current/sw/bin/pinentry-curses";
      #})
      #pinentry
      #pinentry-curses
      gopass
      ncdu
      lazygit
      less
      s5cmd
      tokei
      terraform
      wget
    ];
  };

  # TODO document use of Fira Mono (Fira Code uses ligatures, which are not supported by alacritty).
  # TODO test alacritty with FiraCode. What do the ligatures look like? Maybe test an ASCII-box
  # TODO Setup kitty and play with it - kitty supports ligatures and could use Fira Code
  # TODO I would like to use Fira Code as default. Then I configure Fira Mono as fallback for alacritty.
  fonts =
    let
      nerdfonts = pkgs.nerdfonts.override {
        fonts = [ "DejaVuSansMono" "FiraMono" "FiraCode" ];
      };
    in
    {
      fonts = [ nerdfonts ];
      fontconfig.defaultFonts.monospace =
        # [ "DejaVu Sans Mono Nerd Font Complete Mono" ];
        [ "Fura Mono Regular Nerd Font Complete Mono" ];
    };

  documentation.dev.enable = true;

  #programs.gnupg.agent = {
  #  enable = false;
  #  pinentryFlavor = "curses";
  #};

  programs.thefuck.enable = true;
  programs.firejail.enable = true;
  programs.mtr.enable = true;
  programs.bash-my-aws.enable = true;
}
