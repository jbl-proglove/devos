final: prev: {
  gopass = prev.gopass.overrideAttrs (o: {
    wrapperPath = prev.lib.makeBinPath (
      [
        final.gopass-gpgconf
        prev.git
        prev.gnupg
        prev.xclip
      ] ++ prev.lib.optional prev.stdenv.isLinux prev.wl-clipboard
    );
    postFixup = ''
      wrapProgram $out/bin/gopass \
        --prefix PATH : "${o.wrapperPath}" \
        --set GOPASS_NO_REMINDER true
    '';
  });

  # wrapper to specify config dir
  gopass-gpgconf = prev.writeShellScriptBin "gpgconf" ''
    echo "pinentry:Passphrase Entry:bla"
  '';
  #  gopass = super.gopass.overrideAttrs (oldAttrs: rec{
  #    postInstall = oldAttrs.postInstall or "" +
  #    super.writeShellScript "gpgconf" ''
  #  4   ⦙ echo "pinentry:Passphrase Entry:bla"
  #  5   '';
  #  });
}
