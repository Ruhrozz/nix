{ modulesPath, pkgs, settings, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")

    ./hardware-configuration.nix
    ./disk-config.nix
    ../../nixos/greeter.nix # greetd
    ../../nixos/ssh.nix # openssh
    ../../nixos/bluetooth.nix # bluetoothctl
    ../../nixos/boot.nix # grub
    ../../nixos/sound.nix
    ../../nixos/nautilus.nix
    ../../nixos/nix-ld.nix
    ../../nixos/packages.nix
    ../../nixos/docker.nix
    ../../nixos/opengl.nix
    ../../nixos/hyprland.nix

    # For some games
    ../../nixos/steam.nix
  ];

  # Required
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  i18n.defaultLocale = settings.locale;
  i18n.extraLocaleSettings = { LC_ALL = settings.locale; };
  i18n.supportedLocales = ["en_US.UTF-8/UTF-8" "ru_RU.UTF-8/UTF-8"];
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];

  # Networking
  networking = {
    firewall.enable =
      false; # Disable firewall for OrangePI ethernet connections
    hostName = settings.hostname;
    networkmanager = {
      enable = true;
      wifi.powersave = false;
    };
  };

  # Timezone
  time.timeZone = settings.timezone;
  services.chrony.enable = true;

  # Users
  users.users.root.initialHashedPassword =
    "$y$j9T$3RQ1ut7aoQme6wRqksDAb.$Ed8Gnohw7LO3PKPfrFtpg63.F/0LhULHYHDhpmh1C/2";
  users.users.${settings.username} = {
    isNormalUser = true;
    description = settings.username;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
  };

  environment.systemPackages = with pkgs; [ osu-lazer ];

  # Login automatically because you need password for LUKS
  # services.greetd = {
  #   enable = true;
  #   settings = {
  #     initial_session = {
  #       command = "${pkgs.hyprland}/bin/Hyprland";
  #       user = "${settings.username}";
  #     };
  #   };
  # };

  # Laptop-specific
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  powerManagement = {
    enable = true;
    powertop.enable = true;
  };

  system.stateVersion = "24.11";
}
