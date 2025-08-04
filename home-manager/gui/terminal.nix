{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    shellIntegration = {
      enableZshIntegration = true;
      mode = "no-cursor";
    };
    settings = {
      shell = "${pkgs.zsh}/bin/zsh";
      confirm_os_window_close = 0;
      cursor_shape = "block";
      cursor_blink_interval = 0;
      enable_audio_bell = false;
      window_padding_width = 10;
      window_padding_height = 10;
    };
  };
}
