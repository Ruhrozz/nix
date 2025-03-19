{ settings, ... }: {
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = settings.name;
    userEmail = settings.email;
    delta.enable = true;
    delta.options.side-by-side = true;
    extraConfig.pull.rebase = true;
  };
}
