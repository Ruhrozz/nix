{ settings, lib, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      env.TERM = "xterm-256color";
      terminal.shell = "${pkgs.zsh}/bin/zsh";

      # Forcing font because of Stylix
      font = { size = lib.mkForce settings.fontSize; };

      scrolling.history = 10000;
      selection.save_to_clipboard = true;

      window = {
        class.general = "Alacritty";
        class.instance = "Alacritty";
        padding.x = 10;
        padding.y = 10;
      };
    };
  };
}
