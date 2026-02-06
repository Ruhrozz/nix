{ hostname, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "obsidian" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Asia/Novosibirsk";

  environment.systemPackages = [
    (pkgs.catppuccin-sddm.override {
      flavor = "mocha";
      accent = "peach";
      fontSize = "14";
      loginBackground = true;
    })
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin-mocha-peach";
  };

  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;
  programs.nh = {
    enable = true;
    clean.enable = true;
    flake = "$HOME/.dotfiles"; # sets NH_OS_FLAKE variable for you
  };

  networking.networkmanager.enable = true;
  networking.hostName = hostname;

  users.users.ruhrozz = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [ firefox wget git ];
  };

  system.stateVersion = "25.11";
}
