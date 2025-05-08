{ dir, ... }: {
  themeName = "catppuccin-mocha";
  wallpaper = ../assets/wallpapers/catppuccin_miku.jpg;
  # Stylix palette override.
  override = { base00 = "11111b"; };

  # Override stylix theme of btop.
  overrideBtop = true;
  btopTheme = "catppuccin";

  # Hyprland
  opacity = 0.8;
  rounding = 25;
  shadow = false;
}
