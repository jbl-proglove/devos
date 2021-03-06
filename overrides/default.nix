# override defaults to nixpkgs/master
{
  # modules to pull from override, stable version is automatically disabled
  modules = [ ];

  # if a modules name changed in override, add the old name here
  disabledModules = [ ];

  # packages pulled from override
  packages = pkgs: final: prev: {
    inherit (pkgs)
      awscli2
      cachix
      dhall
      discord
      element-desktop
      #gnupg
      #  haskell-language-server;
      manix
      nixpkgs-fmt
      qutebrowser
      signal-desktop
      starship
      teams
      terraform
      vscode-extensions
      vscodium
      ;

    #    haskellPackages = prev.haskellPackages.override {
    #      overrides = hfinal: hprev:
    #      let version = prev.lib.replaceChars [ "." ] [ "" ] prev.ghc.version;
    #      in
    #      {
    #        # same for haskell packages, matching ghc versions
    #        inherit (pkgs.haskell.packages."ghc${version}")
    #          haskell-language-server;
    #          X11_1_10;
    #      };
    #    };
  };
}
