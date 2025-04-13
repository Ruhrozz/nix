{
  virtualisation.docker = {
    enable = true;
    autoPrune = {
      enable = true;
      dates = "weekly";
    };
    storageDriver = "btrfs";
    daemon.settings = {
      data-root = "/docker/";
    };
  };
}
