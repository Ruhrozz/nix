{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ pavucontrol ];
  security.rtkit.enable = true;

  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
      extraConfig.pipewire = {
        "10-clock-rate" = {
          "context.properties" = {
            "default.clock.allowed-rates" = [ 44100 48000 96000 ];
          };
        };
      };
    };
  };
}
