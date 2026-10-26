{
  # boot.loader.grub = {
  #   enable = true;
  #   efiSupport = true;
  #   # efiInstallAsRemovable = true;
  #   device = "nodev";
  # };
  # or 
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
}
