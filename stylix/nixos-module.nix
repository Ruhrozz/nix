{ pkgs, ... }:

{
  stylix = {
    enable = true;
    autoEnable = true;
    icons = {
      enable = true;
      light = "Papirus-Light";
      dark = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders;
    };
    image = ../assets/shadow-shape-holo.jpeg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    polarity = "dark";

    opacity = let opacity = 0.8;
    in {
      terminal = opacity;
      applications = opacity;
      desktop = opacity;
      popups = opacity;
    };

    cursor = {
      size = 32;
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
    };

    fonts = {
      sizes = {
        applications = 10;
        desktop = 10;
        terminal = 10;
      };
      serif = {
        package = pkgs.nerd-fonts.hack;
        name = "Hack Nerd Font";
      };

      sansSerif = {
        package = pkgs.nerd-fonts.hack;
        name = "Hack Nerd Font";
      };

      monospace = {
        package = pkgs.nerd-fonts.hack;
        name = "Hack Nerd Font Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
