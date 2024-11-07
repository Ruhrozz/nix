{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    mouse = true;
    terminal = "screen-256color";
    keyMode = "vi";
    # plugins = with pkgs; [
    #   {
    #     plugin = tmuxPlugins.sysstat;
    #     extraConfig = ''
    #       set -g status-right "#{sysstat_cpu} | #{sysstat_mem} | #{sysstat_swap} | #{sysstat_loadavg} | #[fg=cyan]#(echo $USER)#[default]@#H"
    #     '';
    #   }
    #   {
    #     plugin = tmuxPlugins.resurrect;
    #     extraConfig = "set -g @resurrect-strategy-nvim 'session'";
    #   }
    #   {
    #     plugin = tmuxPlugins.continuum;
    #     extraConfig = "set -g @continuum-restore 'on'";
    #   }
    # ];
  };
}
