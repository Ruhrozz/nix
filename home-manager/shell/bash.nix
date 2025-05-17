{
  programs.bash = {
    enable = true;
    profileExtra = ''
    if [[ -z "$TMUX" ]] && [[ -n "$SSH_TTY" ]]; then
      exec tmux new -A -s default
      exit
    fi
    '';
  };

  home.file.".hushlogin".text = ''
    Hide some OS login greetings!
  '';
}
