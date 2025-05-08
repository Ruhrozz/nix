{ dir, ... }: {
  themeName = "nord";
  wallpaper = ../assets/wallpapers/nord_miku.jpg;
  override = null;

  # Override stylix theme of btop.
  btopTheme = "nord";

  opacity = 0.9;
  rounding = 25;
  shadow = true;
}
