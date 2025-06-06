{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ mpc-cli ];

  services.mpd-mpris.enable = true;
  services.mpdris2.enable = true;

  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Media/Music/";

    extraConfig = ''
      audio_output {
        type                    "pipewire"
        name                    "My PipeWire Output"
      }

      audio_output {
        type                    "fifo"
        name                    "my_fifo"
        path                    "/tmp/mpd.fifo"
        format                  "44100:16:2"
      }
    '';
  };
}
