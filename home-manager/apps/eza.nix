{
  # `ls` enhanced
  programs.eza = {
    enable = true;
    git = true;
    icons = "auto";
    extraOptions = [ "--group-directories-first" "--header" ];
  };
}
