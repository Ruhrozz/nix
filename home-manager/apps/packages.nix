{ pkgs, ... }: {
  home.packages = with pkgs; [
    sshfs
    unzip
    iptables
    dust # `du -h -d 1` replacement
    duf # `df -h` replacement
    ripgrep # for nvim plugin (telescope)
    shellcheck # for nvim plugin (bashls)
    ffmpeg # working with images and videos in CLI
    clang # build packages
    unzip # archivator
    zip # archivator
    p7zip # archivator
  ];
}
