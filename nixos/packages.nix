{ settings, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    settings.browserPkg

    pciutils # for `lspci`
    usbutils # for `lsusb`
    networkmanagerapplet # gui for editing connections
    nmap # network scanner
    wget # cli download
    curl # cli download
    git # code repositories
    vim # reserve editor
    eog # image viewer
    cantata # music player

    # Some apps
    telegram-desktop # contacts
    obsidian # all my life is here
    vlc # video viewer
    gnome-calculator # calculator

    # For work
    openvpn
    shotcut # video editor
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
    nerd-fonts.dejavu-sans-mono
    settings.fontPkg
  ];

  # A lot of mpris packages require it.
  services.gvfs.enable = true;
}
