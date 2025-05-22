{ inputs, settings, ... }:

# TODO: Remove unstable package. It's dirty hack to make "Cava" work properly
let unstable_pkgs = inputs.nixpkgs-unstable.legacyPackages.${settings.system};
in {

  programs.cava = {
    enable = true;
    package = unstable_pkgs.cava;
  };
  programs.waybar = {
    enable = true;
    package = unstable_pkgs.waybar;
    style = builtins.readFile ./style.css;
    systemd.enable = true;
    settings = {
      main = {
        layer = "top";
        position = "top";

        modules-left = [ "group/system" ];
        modules-center = [ "hyprland/workspaces" ];
        # modules-right = [ "hyprland/language" "bluetooth" "cpu" "memory" "disk" "temperature" "wireplumber" "battery" "network" "clock" ];
        modules-right =
          [ "pulseaudio" "battery" "hyprland/language" "clock" "tray" ];

        "group/system" = {
          drawer = {
            transition-duration = 500;
            transition-left-to-right = true;
          };
          modules = [ "cava" "disk" "cpu" "memory" "temperature" ];
          orientation = "inherit";
        };

        cava = {
          cava_config = "$XDG_CONFIG_HOME/cava/config";
          framerate = 30;
          autosens = 1;
          bars = 14;
          lower_cutoff_freq = 50;
          higher_cutoff_freq = 10000;
          method = "pipewire";
          source = "auto";
          stereo = true;
          bar_delimiter = 0;
          noise_reduction = 0.77;
          input_delay = 2;
          hide_on_silence = true;
          format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
          actions = { on-click-right = "mode"; };
        };

        pulseaudio = {
          format = " {icon} {volume}%";
          format-muted = "  ";
          format-icons.default = [ " " " " " " ];
          on-click = "pavucontrol";
        };

        clock = {
          # locale = "ru_RU.UTF-8";
          timezone = "Asia/Novosibirsk";
          format = "{:%R} ";
          format-alt = "{:%H:%M %d.%m.%Y} ";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
        };

        battery = {
          states.warning = 30;
          states.critical = 10;
          format-icons = [ " " " " " " " " " " ];
          format = "{capacity}% {icon} ";
          format-charging = "{capacity}% {icon}󱐋";
          format-plugged = "{capacity}% {icon}󰚥";
        };

        tray = {
          icon-size = 21;
          spacing = 10;
        };

        bluetooth = {
          format = " {status}";
          format-disabled = "";
          format-connected = " {num_connections} connected";
          tooltip-format = "{controller_alias}	{controller_address}";
          tooltip-format-connected = ''
            {controller_alias}	{controller_address}

            {device_enumerate}'';
          tooltip-format-enumerate-connected =
            "{device_alias}	{device_address}";
        };

        cpu = {
          interval = 10;
          format = "{}%  ";
          max-length = 10;
        };

        disk = {
          interval = 30;
          format = " {percentage_used}% 󰋊 ";
        };

        memory = {
          interval = 30;
          format = "{}%   ";
          max-length = 10;
        };

        "hyprland/language" = {
          format-en = "EN";
          format-ru = "RU";
        };

        "hyprland/workspaces" = {
          format = " {id} ";
          disable-scroll = true;
          sort-by-name = true;
          persistent-workspaces."*" = 5;
        };

        reload_style_on_change = true;
      };
    };
  };
}
