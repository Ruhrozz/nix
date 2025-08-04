{pkgs, ...}:

{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune = {
      enable = true;
      dates = "weekly";
    };
    storageDriver = "btrfs";

    daemon.settings = {
      data-root = "/docker/";
      runtimes.nvidia = {
        "path" = "${pkgs.nvidia-container-toolkit}/bin/nvidia-container-runtime";
        "runtimeArgs" = [ ];
      };
    };
  };
}
