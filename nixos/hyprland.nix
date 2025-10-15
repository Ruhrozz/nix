{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      hyprland = {
        prettyName = "Hyprland";
        comment = "Hyprland compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/Hyprland";
      };
    };
  };

  xdg = {
    autostart.enable = true;
    portal = {
      enable = true;
      xdgOpenUsePortal =
        false; # Disabled - causes issues with OpenURI portal interface
      config = {
        common.default = [ "gtk" ];
        hyprland.default = [ "hyprland" ];
      };
      extraPortals = with pkgs; [
        xdg-desktop-portal
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk
      ];
    };
  };
}
