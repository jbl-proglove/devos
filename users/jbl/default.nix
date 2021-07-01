{ ... }:
let
  fingerprint_internal = "00ffffffffffff000daec91400000000161c0104951f11780228659759548e271e505400000001010101010101010101010101010101b43b804a71383440503c680035ad1000001ac22f804a71383440503c680035ad1000001a000000fe0058334b4733803134304843410a000000000000413196001000000a010a2020004c";
  fingerprint_dell = "00ffffffffffff0010acdad054574433231d010380351e78ea0565a756529c270f5054a54b00714f8180a9c0d1c00101010101010101023a801871382d40582c45000f282100001e000000ff003659593330393854334457540a000000fc0044454c4c205032343139480a20000000fd00384c1e5311000a2020202020200122020317b14c9005040302071601141f121365030c001000023a801871382d40582c45000f282100001e011d8018711c1620582c25000f282100009e011d007251d01e206e2855000f282100001e8c0ad08a20e02d10103e96000f282100001800000000000000000000000000000000000000000000000000000000000000003d";
in
{
  imports = [ ../../profiles/ssh ];

  home-manager.users.jbl = { suites, ... }: {
    imports = suites.coding;

    # setup files in /home/jbl/
    home.file = {
      ".zshrc".text = "# just here to avoid zsh running the setup on every launch...";
      #      "gnupg/gpg-agent.conf".text = ''
      #        pinentry-program ${pkgs.pinentry_curses}/bin/pinentry-curses
      #      '';

      # Based on https://konfou.xyz/posts/nixos-without-display-manager/
      # to get rid of the display manager
      ".xinitrc".text = ''
        #!/bin/sh

        userresources=$HOME/.Xresources
        usermodmap=$HOME/.Xmodmap
        sysresources=/nix/store/27wfgx3m2cq96k9lvs88b9yjxha6j8l3-xinit-1.4.1/etc/X11/xinit/.Xresources
        sysmodmap=/nix/store/27wfgx3m2cq96k9lvs88b9yjxha6j8l3-xinit-1.4.1/etc/X11/xinit/.Xmodmap

        # merge in defaults and keymaps

        if [ -f $sysresources ]; then
          xrdb -merge $sysresources
        fi

        if [ -f $sysmodmap ]; then
            xmodmap $sysmodmap
        fi

        if [ -f "$userresources" ]; then
            xrdb -merge "$userresources"
        fi

        if [ -f "$usermodmap" ]; then
            xmodmap "$usermodmap"
        fi

        # start some nice programs

        if [ -d /nix/store/27wfgx3m2cq96k9lvs88b9yjxha6j8l3-xinit-1.4.1/etc/X11/xinit/xinitrc.d ] ; then
          for f in /nix/store/27wfgx3m2cq96k9lvs88b9yjxha6j8l3-xinit-1.4.1/etc/X11/xinit/xinitrc.d/?*.sh ; do
            [ -x "$f" ] && . "$f"
          done
          unset f
        fi

        # TODO fix using paths in /etc
        picom --config /nix/store/whax4xand5ckbvcp6rkq5qhmzifkin62-picom.conf --experimental-backends &
        exec xmonad
      '';

      ".zprofile".text = ''
        #!/bin/sh
        if [ -z "$DISPLAY" ] && [ "$TTY" = "/dev/tty1" ]; then
          exec startx
        fi
      '';
      ".profile".text = ''
        #!/bin/sh
        if [ -z "$DISPLAY" ] && [ "$TTY" = "/dev/tty1" ]; then
          exec startx
        fi
      '';
    };

    # TODO find a better way to setup gnupg as a (user?) profile
    #    programs.gnupg.agent = {
    #      enable = true;
    #      enableSSHSupport = true;
    #    };

    programs.git = {
      userName = "Julius Blank";
      userEmail = "julius.blank@proglove.de";
    };

    programs.autorandr = {
      enable = true;
      profiles = {
        ## only the builtin laptop monitor
        "laptop" = {
          fingerprint = {
            "eDP-1" = ${fingerprint_internal};
          };
          config = {
            "eDP-1" = {
              enable = true;
              primary = true;
              position = "0x0";
              mode = "1920x1080";
              #gamma = "1.0:0.909:0.833";
              #rate = "60.00";
            };
          };
        };
        ## setup for the external dell monitor above the laptop monitor
        "dual-topdown" = {
          fingerprint = {
            "eDP-1" = ${fingerprint_internal};
            "HDMI-1" = ${fingerprint_dell};
          };
          config = {
            "DP-1" = {
              enable = true;
              primary = true;
              position = "0x0";
              mode = "1920x1080";
              #gamma = "1.0:0.909:0.833";
              #rate = "60.00";
            };
          };
          config = {
            "eDP-1" = {
              enable = true;
              primary = false;
              position = "0x1080";
              mode = "1920x1080";
              #gamma = "1.0:0.909:0.833";
              #rate = "60.00";
            };
          };
        };
        ## setup for the big one at home, the portable screen and the laptop
        "triple-screen" = {
          fingerprint = {
            "eDP-1" = ${fingerprint_internal};
            "HDMI-1" = "00ffffffffffff0005e377320b030000231a0103804728782a9145a7554ea0250c5054bfef00d1c0b30095008180814081c001010101565e00a0a0a0295030203500c48f2100001e000000fd00324c1e631e000a202020202020000000fc0051333237370a20202020202020000000ff004c475847394a413030303737390133020320f14b101f051404130312021101230907078301000067030c001000383c023a801871382d40582c4500c48f2100001e011d007251d01e206e285500c48f2100001e8c0ad08a20e02d10103e9600c48f210000188c0ad090204031200c405500c48f21000018f03c00d051a0355060883a00c48f2100001c000000000019";
            "DP-1" = "00ffffffffffff0066886015010101010b1e0104b03c21783e6435a5544f9e27125054210800d1c0b300a9c0950090408180814081c0293680a070381f40302035002c041100001e000000fc0059544831353650430a20202020000000ff000a202020202020202020202020000000fd00303f686813010a202020202020015c020334f143101f04230907078301000067030c001000382667d85dc401448001e50f00000600e305c000e200ffe60605015959495730801871382d40582c25002c041100001e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000eb";
          };
          config = {
            "eDP-1" = {
              enable = true;
              primary = false;
              position = "2560x0";
              mode = "1920x1080";
            };
          };
          config = {
            "HDMI-1" = {
              enable = true;
              primary = true;
              position = "0x0";
              mode = "2560x1440";
            };
          };
          config = {
            "DP-1" = {
              enable = true;
              primary = false;
              position = "0x1440";
              mode = "1920x1080";
            };
          };
        };
      };
    };
  };

  users.users.jbl = {
    uid = 1001;
    password = "nixos";
    description = "Julius Blank";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
