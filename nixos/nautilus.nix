{ settings, pkgs, lib, ... }: {
  environment.systemPackages = with pkgs; [ nautilus sushi ];

  services.gnome.sushi.enable = true;

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = lib.getExe settings.termPkg;
  };
}
