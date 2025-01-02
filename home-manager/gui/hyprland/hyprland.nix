{ inputs, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    xwayland.enable = true;
    enable = true;
    package =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    systemd.enable = true;
    # plugins = [ inputs.hypr-dynamic-cursors.packages.${pkgs.system}.hypr-dynamic-cursors ];
  };

  home.packages = with pkgs; [
    hyprpicker
    hyprshot # screenshot handler
  ];
}
