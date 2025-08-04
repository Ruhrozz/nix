{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    xwayland.enable = true;
    enable = true;
    plugins = with pkgs; [ hyprlandPlugins.hypr-dynamic-cursors ];
  };

  home.packages = with pkgs; [
    hyprpicker
    hyprshot # screenshot handler
  ];
}
