{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    mouse = true;
    prefix = "C-space";
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "screen-256color";
    keyMode = "vi";
    extraConfig = ''
      set-option -sa terminal-overrides ",xterm*:Tc"
    '';
    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
      # {
      #   plugin = tmuxPlugins.sysstat;
      #   extraConfig = ''
      #     set -g status-right "#{sysstat_cpu} | #{sysstat_mem} | #{sysstat_swap} | #{sysstat_loadavg} | #[fg=cyan]#(echo $USER)#[default]@#H"
      #   '';
      # }
      # {
      #   plugin = tmuxPlugins.resurrect;
      #   extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      # }
      # {
      #   plugin = tmuxPlugins.continuum;
      #   extraConfig = "set -g @continuum-restore 'on'";
      # }
    ];
  };
}
