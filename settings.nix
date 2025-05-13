{ pkgs, ... }: rec {
  system = "x86_64-linux";

  hostname = "nixos";
  username = "malofeev";
  name = "Malofeev Ivan";
  email = "i.malofeev@expasoft.tech";

  timezone = "Asia/Novosibirsk";
  locale = "en_US.UTF-8";

  profile = "remote";
  dotfilesDir = "/home/${username}/.dotfiles"; # Absolute path of the local repo
  theme = "catppuccin"; # catppuccin / nord
  themeDetails = import (./. + "/themes/${theme}.nix") { dir = dotfilesDir; };

  # Default font for terminal
  # font = "DejaVuSansM Nerd Font Mono";
  font = "Hack Nerd Font Mono";
  fontPkg = (pkgs.nerdfonts.override { fonts = [ "DejaVuSansMono" "Hack" ]; });
  fontSize = 12;

  # Icon theme for nautilus
  icons = "Adwaita";
  iconsPkg = pkgs.adwaita-icon-theme;

  # Default editor
  editor = "nvim";

  # Default browser
  browser = "firefox";
  browserPkg = pkgs.firefox;

  # Default terminal command
  term = "alacritty";
  termPkg = pkgs.alacritty;
}
