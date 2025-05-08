{
  programs.waybar = {
    enable = true;
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
          [ "pulseaudio" "hyprland/language" "clock" "tray" ];

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = " ";
          format-icons.default = [ " " " " " " ];
          on-click = "pavucontrol";
        };

        clock = {
          locale = "ru_RU.UTF-8";
          timezone = "Asia/Novosibirsk";
          format = "{:%H:%M %d.%m}";
          format-alt = "{:%H:%M %d.%m.%Y}";
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
          format = "{percentage_used}% 󰋊 ";
        };

        memory = {
          interval = 30;
          format = "{}%  ";
          max-length = 10;
        };

        "group/system" = {
          drawer = {
            transition-duration = 500;
            transition-left-to-right = true;
          };
          modules = [ "disk" "cpu" "memory" "temperature" "battery" ];
          orientation = "inherit";
        };

        "hyprland/language" = {
          format-en = "EN";
          format-ru = "RU";
        };

        "hyprland/workspaces" = {
          format = " {id} ";
          disable-scroll = true;
          sort-by-name = true;
        };

        reload_style_on_change = true;
      };
    };
  };
}
