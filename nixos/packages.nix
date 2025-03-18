{ settings, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    pciutils # for `lspci`
    usbutils # for `lsusb`
    networkmanagerapplet # gui for editing connections
    nmap # network scanner
    wget # cli download
    curl # cli download
    git # code repositories
    vim # reserve editor
    eog # image viewer
    vlc # video viewer
    firefox # browser
    gnome-calculator # calculator

    # Some apps
    telegram-desktop # contacts
    obsidian # all my life is here

    # For ags
    brightnessctl
    swww

    # For work
    shotcut # video editor
    openvpn
    yt-dlp # download from youtube
    anydesk # remote desktop
    libreoffice # documents
    qgroundcontrol # air fly control
    sublime4 # text editor
    android-tools # adb
  ];

  fonts.packages = with pkgs; [
    corefonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    noto-fonts-color-emoji
    settings.fontPkg
  ];

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = [ "gtk" ];
      hyprland.default = [ "hyprland" ];
    };

    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
