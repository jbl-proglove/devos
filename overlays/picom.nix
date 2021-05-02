final: prev: {
  picom = prev.picom.overrideAttrs
    (_:
      let src = prev.srcs.picom;
      in
      {
        inherit src;
        inherit (src) version;
      });
}
