{ dir, ... }: {
  themeName = "catppuccin-mocha";
  wallpaper = ../assets/wallpapers/catppuccin_miku.jpg;
  # Stylix palette override.
  override = { base00 = "11111b"; };

  # Override stylix theme of btop.
  overrideBtop = true;
  btopTheme = "catppuccin";

  # Hyprland and ags.
  opacity = 0.8; # affects theme.blur in ags.
  rounding = 25; # affects theme.rounding in ags.
  shadow = false; # affects theme.shadows in ags.

  # Override default settings in ags.
  ags = {
    theme = {
      palette = { widget = "#25253a"; };
      border = {
        width = 1;
        opacity = 96;
      };
    };
    bar = { curved = true; };
    widget = { opacity = 0; };
  };
}
