{ username, inputs, pkgs, ... }:

{
  imports = [ ./terminal ./stylix/hm-module.nix ];

  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.11";
  home.sessionVariables.EDITOR = "nvim";
  home.packages = [ inputs.ruhrozz-nixvim.packages.${pkgs.system}.default ];

  programs.home-manager.enable = true;
  programs.nh = {
    enable = true;
    clean.enable = true;
    flake = "$HOME/.dotfiles"; # sets NH_OS_FLAKE variable for you
  };
}
