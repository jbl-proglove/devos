{ suites, ... }:
{
  imports = suites.progloveLaptop;


  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "de_DE.UTF-8";
  networking.useDHCP = false;
  networking.interfaces.enp0s31f6.useDHCP = true;
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

  swapDevices = [ ];

}
