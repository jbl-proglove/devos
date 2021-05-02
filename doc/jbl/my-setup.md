# My (jbl) setup

The goal of my journey I'm trying to document here is actually not one,
but several:

* learn and understand Linux, and NixOS as well as its package manager
  Nix
* create a consistent, understood, documented and reproducible system
  configuration
* improve the security posture of my setup
* improve my life as an IT professional ;-)

The next sections outline the configuration I'm going for. Open tasks
are marked as such.

A second, note-worthy point is that this repo is serving as the base for
not only my professional configuration, but also for my son's laptop.
The starting point for the different configurations can be examined in
the definition of [profiles/suites.nix](../profiles/suites.nix), where
`progloveLaptop` is used for my professional setup, and `privateLaptop`
is used for my son's machine.

## base system

The system is running NixOS. A dual-boot with other distro(s) is
currently not planned.

The setup is based on divnix/devos, the current suite `progloveLaptop`
contains the profiles `core`, `develop`, `graphical`, `laptop` and
`proglove`.

### file system


## X / window management

The goal is to stay as lightweight as possible. I do not want to use and
desktop management software, actually I don't even need a display
manager for that matter.
Thus, the idea is to configure xinit in a way that `startx` is invoked
directly instead of using a display manager.

Another idea is to customize the X startup based on which tty I login.
An example: login on tty1 and start xmonad using xinitrc. Login on tty2
and get plain shell. Could be nice to experiment with different methods.

Currently, the setup uses lightdm with the mini-greeter.


Links:

* https://www.sitepoint.com/understanding-nix-login-scripts/

### Picom

It took me a while to find out how to use the picom fork of ... which
also supports nice blurring of window backgrounds.
Turns out I was trying to set the picom settings using home-manager, as
shown in most examples. I got errors like `unknown option
service.picom.blur`, which is - in fact - a home-manager setting. Once I
set the config using service.picom.settings, it worked.
In order to use the picom fork by ibhagwan, I had to setup an overlay.

TODO test whether blur with `dual_kawanse` also works without the fork.
TODO test whether I should use the current version of the fork instead
of the now referenced version 7.

I managed to switch to a specific revision by adding the commit in
`pkgs/flake.nix`.

### Fonts

The main font in use is Fira Mono from the Nerdfonts repository.

Actually, the preferred font is FiraCode, but the currently setup
terminal emulator `alacritty` does not support ligatures and is listed
explicitly as not supported on the font's website.

TODO Setup an alternative shortcut in xmonad to launch kitty, which is
configured using FiraCode - kitty supports ligatures.

### XMonad

XMonad is used as the window manager

### xmobar

### tmux



## vim

* TODO better color scheme

## VSCode


