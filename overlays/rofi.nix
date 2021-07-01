final: prev: {
  rofi = prev.rofi.overrideAttrs
    (_:
      let src = prev.srcs.rofi;
      in
      {
        inherit src;
        inherit (src) version;
      });
}
