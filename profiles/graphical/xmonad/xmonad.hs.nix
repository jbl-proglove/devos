{ pkgs, ... }:
let
  inherit (builtins) readFile;
  inherit (pkgs) writeScript;

  screenshots = "Pictures/shots";

  autostart = writeScript "xmonad-autostart" (readFile ./scripts/autostart);

  # TODO probably obsolete due to lightdm-mini-greeter, but that's guesswork
  stoggle = writeScript "xmonad-stoggle" (readFile ./scripts/stoggle);

  #  volnoti = import ../misc/volnoti.nix { inherit pkgs; };
in
''
    ${readFile ./_xmonad.hs}
    ${import ./_xmonad.nix {
      inherit
      screenshots
      autostart
      stoggle
      pkgs
  #    volnoti
      ;
      }}
''
