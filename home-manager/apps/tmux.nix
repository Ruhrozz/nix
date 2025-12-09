{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    mouse = true;
    prefix = "C-space";
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    keyMode = "vi";
    extraConfig = ''
      set-option -sa terminal-overrides ",xterm*:Tc"
      set -sg escape-time 10
      set -sg focus-events on
      set -g status-interval 1
      set -g bell-action none
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
