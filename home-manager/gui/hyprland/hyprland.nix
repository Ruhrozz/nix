{ inputs, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    xwayland.enable = true;
    enable = true;
    package =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    plugins = with pkgs; [ hyprlandPlugins.hypr-dynamic-cursors ];
  };

  home.packages = with pkgs; [
    hyprpicker
    hyprshot # screenshot handler
  ];
}
