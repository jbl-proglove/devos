final: prev: {
  pure = prev.callPackage ./shells/zsh/pure { };
  widevine-cdm = prev.callPackage ./applications/networking/browsers/widevine { };
}
