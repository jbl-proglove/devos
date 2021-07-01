{ lib, stdenv, srcs }:
let src = srcs.grub2-theme-virtuaverse;
in
stdenv.mkDerivation {
  inherit src;

  name = "grub2-theme-virtuaverse";

  installPhase = ''
    cp -r ./grub/themes/virtuaverse/* $out
  '';

  meta = with lib; {
    description = "grub2 theme Virtuverse";
    homepage = "https://github.com/Patato777/dotfiles";
    maintainers = [ maintainers.nrdxp ];
    platforms = platforms.unix;
    license = licenses.mit;
    inherit version;
  };
}
