{ modulesPath, pkgs, settings, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")

    ./hardware-configuration.nix
    ./disk-config.nix
    ../../nixos/greeter.nix
    ../../nixos/ssh.nix
    ../../nixos/bluetooth.nix
    ../../nixos/boot.nix
    ../../nixos/sound.nix
    ../../nixos/nautilus.nix
    ../../nixos/nix-ld.nix
    ../../nixos/packages.nix
    ../../nixos/nvidia.nix

    # For some games
    ../../nixos/steam.nix
    ../../nixos/appimage.nix
    ../../nixos/opentabletdriver.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Netorking
  networking.hostName = settings.hostname;
  networking.networkmanager.enable = true;

  # Timezone
  time.timeZone = settings.timezone;
  services.chrony.enable = true;

  # Locale
  i18n.defaultLocale = settings.locale;
  i18n.extraLocaleSettings = { LC_ALL = settings.locale; };

  # Users
  users.users.root.initialHashedPassword =
    "$y$j9T$3RQ1ut7aoQme6wRqksDAb.$Ed8Gnohw7LO3PKPfrFtpg63.F/0LhULHYHDhpmh1C/2";
  users.users.${settings.username} = {
    isNormalUser = true;
    description = settings.username;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  environment.systemPackages = with pkgs; [ osu-lazer ];

  # A lot of mpris packages require it.
  services.gvfs.enable = true;

  system.stateVersion = "24.05";
}
