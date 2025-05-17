{ settings, ... }: {
  imports = [
    ../../themes/stylix.nix
    ../../home-manager/apps
    ../../home-manager/shell
  ];

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;

  home = {
    username = settings.username;
    homeDirectory = "/home/${settings.username}";
    sessionVariables = { EDITOR = settings.editor; };
    stateVersion = "23.05";

    file.".config/nix/nix.conf".text = ''
      experimental-features = nix-command flakes
    '';
  };
}
