{
  programs.git = {
    enable = true;
    lfs.enable = true;
    extraConfig.pull.rebase = true;
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options.side-by-side = true;
  };
}
