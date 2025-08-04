{ pkgs, config, ... }:

{
  # GPU monitoring, run `nvtop`
  environment.systemPackages = with pkgs; [ nvtopPackages.full cudatoolkit ];

  environment.sessionVariables.CUDA_HOME = "${pkgs.cudatoolkit}";

  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    nvidia-container-toolkit.enable = true;
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
