{ pkgs, config, ... }:

{
  # GPU monitoring, run `nvtop`
  environment.systemPackages = with pkgs; [ nvtopPackages.full ]; 

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    graphics.enable = true;

    nvidia = {
      powerManagement = {
        enable = false;
        finegrained = false;
      };
      nvidiaPersistenced = false;
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
  };
}
