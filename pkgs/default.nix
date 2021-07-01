final: prev: {
  pure = prev.callPackage ./shells/zsh/pure { };
  widevine-cdm = prev.callPackage ./applications/networking/browsers/widevine { };
  grub2-theme-virtualverse = prev.callPackage ./themes/grub2/virtualverse { };
}
