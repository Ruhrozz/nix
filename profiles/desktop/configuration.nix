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
    ../../nixos/opengl.nix
    ../../nixos/hyprland.nix
    ../../nixos/gitlab_runner.nix
    ../../nixos/nvidia.nix
    ../../nixos/docker.nix

    # For some games
    ../../nixos/steam.nix
    ../../nixos/appimage.nix
    ../../nixos/opentabletdriver.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.cudaSupport = true;
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [ "https://nix-community.cachix.org" ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  # Netorking
  networking.hostName = settings.hostname;
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  # Timezone
  time.timeZone = settings.timezone;
  services.chrony.enable = true;
  services.deluge.enable = true;

  # Locale
  i18n.defaultLocale = settings.locale;
  i18n.extraLocaleSettings = { LC_ALL = settings.locale; };
  i18n.supportedLocales = [ "en_US.UTF-8/UTF-8" "ru_RU.UTF-8/UTF-8" ];

  # Users
  users.users.root.initialHashedPassword =
    "$y$j9T$3RQ1ut7aoQme6wRqksDAb.$Ed8Gnohw7LO3PKPfrFtpg63.F/0LhULHYHDhpmh1C/2";
  users.users.gitlab-runner = {
    isSystemUser = true;
    group = "docker";
  };
  users.users.${settings.username} = {
    isNormalUser = true;
    description = settings.username;
    extraGroups = [ "wheel" "networkmanager" "dialout" "docker" ];
  };

  environment.systemPackages = with pkgs; [ osu-lazer ];

  # A lot of mpris packages require it.
  services.gvfs.enable = true;

  system.stateVersion = "24.05";
}
