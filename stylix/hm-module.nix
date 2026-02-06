{ pkgs, ... }:

{
  stylix = {
    enable = true;
    autoEnable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    targets = {
      nixvim.enable = true;
      tmux.enable = true;
      hyprland.enable = true;
      starship.enable = true;

      waybar = {
        font = "sansSerif";
        enable = true;
        addCss = true;
        colors.enable = true;
      };

      kitty.enable = true;
      kitty.fonts.enable = false;
    };
  };
}
