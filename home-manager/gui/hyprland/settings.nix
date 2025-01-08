{ config, settings, ... }:
let details = settings.themeDetails;
in {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "swww-daemon &"
      "ags &"
      "blueman-applet &"
      "[workspace 2 silent] firefox"
      "[workspace 3 silent] nautilus"
      "[workspace special silent] telegram-desktop"
      "[workspace special silent] obsidian"
    ];

    cursor = { no_hardware_cursors = true; };

    general = {
      gaps_in = 8;
      gaps_out = 16;
      border_size = 2;
      allow_tearing = true;
      "col.active_border" = "rgba(${config.lib.stylix.colors.base0D}ff)";
      "col.inactive_border" = "rgba(${config.lib.stylix.colors.base02}ff)";
    };

    decoration = {
      dim_special = 0.4;
      rounding = details.rounding;
      blur = {
        enabled = true;
        special = true;
        brightness = 1.0;
        contrast = 1.0;
        noise = 2.0e-2;
        passes = 2;
        size = 10;
      };

      shadow = {
        enabled = details.shadow;
        ignore_window = false;
        offset = "2 2";
        range = 20;
        color = "rgba(${config.lib.stylix.colors.base00}ff)";
      };
    };

    animations = {
      enabled = true;
      bezier = [
        "wind, 0.05, 0.9, 0.1, 1.05"
        "winIn, 0.1, 1.1, 0.1, 1.1"
        "winOut, 0.3, -0.3, 0, 1"
        "liner, 1, 1, 1, 1"
        "workIn, 0.72, -0.07, 0.41, 0.98"
      ];
      animation = [
        "windows, 1, 6, wind, slide"
        "windowsIn, 1, 6, winIn, slide"
        "windowsOut, 1, 5, winOut, slide"
        "windowsMove, 1, 5, wind, slide"
        "border, 1, 1, liner"
        "borderangle, 1, 30, liner, loop"
        "fade, 1, 10, default"
        "workspaces, 1, 5, wind"
        "specialWorkspace, 1, 5, workIn, slidevert"
      ];
    };

    debug = { disable_logs = false; };

    input = {
      kb_layout = "us,ru";
      kb_options = "grp:alt_shift_toggle";
      follow_mouse = true;
      touchpad = { natural_scroll = true; };
    };

    device = {
      name = "logitech-usb-receiver-mouse";
      sensitivity = -1.0;
    };

    gestures = {
      workspace_swipe = true;
      workspace_swipe_distance = 200;
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
      force_split = 2;
      split_width_multiplier = 1.5;
    };

    misc = {
      disable_hyprland_logo = true;
      vrr = 2;
    };
  };
}
