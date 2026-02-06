{ pkgs, ... }:

{
  imports = [
    ./eza.nix
    ./git.nix
    ./htop.nix
    ./tmux.nix
    ./zoxide.nix
    ./direnv.nix
    ./zsh.nix
    ./starship.nix
    ./bash.nix
  ];

  home.packages = with pkgs; [
    dust # `du -h -d 1` replacement
    duf # `df -h` replacement
    kitty # show images in kitty terminal
    glibcLocales # fixing locale problems on Ubuntu
    ripgrep # for nvim plugin (telescope)
    shellcheck # for nvim plugin (bashls)
    gcc # for nvim runtime
  ];

  services.ssh-agent.enable = true;
  programs.bat.enable = true;
  programs.yazi.enable = true;
}
