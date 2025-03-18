{ pkgs, ... }: {
  home.packages = with pkgs; [
    sshfs
    unzip
    dust # `du -h -d 1` replacement
    duf # `df -h` replacement
    ripgrep # for nvim plugin (telescope)
    shellcheck # for nvim plugin (bashls)
  ];
}
