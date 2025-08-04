{ config, pkgs, settings, lib, ... }: {
  imports = [
    ../../themes/stylix.nix
    ../../home-manager/gui
    ../../home-manager/apps
    ../../home-manager/shell
  ];

  # Hypland GUI settings
  wayland.windowManager.hyprland.settings = {
    # monitor = [ ", preferred, auto, 1" ];
    # monitor = [ "HDMI-A-1, 1920x1080, auto, 1" ];
  };

  home = {
    username = settings.username;
    homeDirectory = "/home/${settings.username}";
  };

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
    TERM = lib.getExe settings.termPkg;
    BROWSER = lib.getExe settings.browserPkg;
  };

  programs.home-manager.enable = true;

  home.stateVersion = "23.05";
}
