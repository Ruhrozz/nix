{ pkgs, ... }:

{
  home.packages = with pkgs; [
    telegram-desktop
    obsidian
    nautilus
    networkmanagerapplet
  ];
}
