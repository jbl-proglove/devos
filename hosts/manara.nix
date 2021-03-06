{ pkgs, suites, hardware, ... }:
{
  # TODO some day, I'll contribute one for the 5490...
  imports = suites.progloveLaptop ++ [ hardware.dell-latitude-3480 ];

  environment.systemPackages = with pkgs; [
    lolcat
  ];

  #  hardware.video.hidpi.enable = true;
  console =
    #    let
    #      normal = with theme.colors; [ c0 c1 c2 c3 c4 c5 c6 c7 ];
    #      bright = with theme.colors; [ c8 c9 c10 c11 c12 c13 c14 c15 ];
    #    in
    {
      packages = [ pkgs.powerline-fonts ];
      font = "ter-powerline-v24n";
      #      colors = normal ++ bright;
      earlySetup = true;
      keyMap = "us";
    };

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  networking.useDHCP = false;
  networking.interfaces.enp0s31f6.useDHCP = true;
  #networking.wireless.enable = true;
  networking.networkmanager.enable = true;
  networking.interfaces.wlp2s0.useDHCP = true;
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "nodev";
    efiSupport = true;
    enableCryptodisk = true;

    configurationLimit = 20;

    gfxmodeEfi = "1920x1280";
    #    theme = pkgs.grub2-themes-virtuaverse;
    splashImage = pkgs.nixos-artwork.wallpapers.stripes-logo.gnomeFilePath;
    backgroundColor = "#292A36";
  };

  boot.initrd = {
    luks.devices."root" = {
      device = "/dev/disk/by-uuid/093c926a-b950-493d-a5b8-3f968ae95119"; # UUID for /dev/nvme01np2
      preLVM = true;
      keyFile = "/keyfile0.bin";
      allowDiscards = true;
    };
    secrets = {
      # Create /mnt/etc/secrets/initrd directory and copy keys to it
      "keyfile0.bin" = "/etc/secrets/initrd/keyfile0.bin";
    };
  };

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/80d16c38-b3c8-4d95-9c51-9d64c17c40eb";
      fsType = "ext4";
    };

  #  fileSystems."/nix/store" =
  #    { device = "/nix/store";
  #      fsType = "none";
  #      options = [ "bind" ];
  #    };
  #
  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/8C4C-E83F";
      fsType = "vfat";
    };

  swapDevices = [{ device = "/dev/disk/by-uuid/f8c073c1-12c5-4c2c-a2f8-5d089d6e1b19"; }];

}
