{ config, pkgs, settings, ... }: {
  imports = [
    ../../themes/stylix.nix
    ../../home-manager/gui
    ../../home-manager/apps
    ../../home-manager/shell
  ];

  # Hypland GUI settings
  stylix.targets.hyprland.enable = false;
  wayland.windowManager.hyprland.settings = {
    # monitor = [ ", preferred, auto, 1" ];
    # monitor = [ "eDP-1, 1920x1200, auto, 1" ];
    monitor = [
      "eDP-1, 1680x1050, auto, 1"
      # "eDP-1, 1920x1200, auto, 1"
      "HDMI-A-1, preferred, auto, 1, mirror, eDP-1"
    ];
    # monitor = [ "eDP-1, 1440x900, auto, 1" ];
  };

  home = {
    username = settings.username;
    homeDirectory = "/home/${settings.username}";
  };

  # Add packages from the pkgs dir
  nixpkgs.config.allowUnfree = true;

  xdg = {
    enable = true;

    userDirs = {
      enable = true;
      createDirectories = true;

      music = "${config.home.homeDirectory}/Media/Music";
      videos = "${config.home.homeDirectory}/Media/Videos";
      pictures = "${config.home.homeDirectory}/Media/Pictures";
      download = "${config.home.homeDirectory}/Downloads";
      documents = "${config.home.homeDirectory}/Documents";

      templates = null;
      desktop = null;
      publicShare = null;

      extraConfig = {
        XDG_PICTURES_DIR = "${config.home.homeDirectory}/Media/Pictures";
        XDG_DOTFILES_DIR = "${settings.dotfilesDir}";
        XDG_BOOK_DIR = "${config.home.homeDirectory}/Media/Books";
      };
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = settings.icons;
      package = settings.iconsPkg;
    };
  };

  home.sessionVariables = {
    EDITOR = settings.editor;
    TERM = settings.term;
    BROWSER = settings.browser;
  };

  programs.home-manager.enable = true;

  home.stateVersion = "23.05";
}
