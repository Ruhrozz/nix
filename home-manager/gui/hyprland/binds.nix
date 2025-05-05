{ settings, ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    # Mouse bindings.
    bindm = [ "$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow" ];

    binde = [
      ", XF86AudioRaiseVolume, exec, pulsemixer --change-volume +5"
      ", XF86AudioLowerVolume, exec, pulsemixer --change-volume -5"
      ", XF86MonBrightnessUp, exec, brightnessctl s +5%"
      ", XF86MonBrightnessDown, exec, brightnessctl s 5%-"
      "$mod ALT, k, exec, pulsemixer --change-volume +5"
      "$mod ALT, j, exec, pulsemixer --change-volume -5"
    ];

    bind = [
      # Window/Session actions.
      "$mod, W, killactive,"
      "$mod SHIFT, F, fullscreen, 1"
      "$mod, F, fullscreen,"
      "$mod, E, togglefloating,"
      "$mod, delete, exit,"

      # Dwindle
      "$mod SHIFT, P, togglesplit,"
      "$mod, P, pseudo,"

      # Lock screen
      "$mod, Escape, exec, uwsm app -- hyprlock"

      # Application shortcuts.
      "$mod, Return, exec, uwsm app -- ${settings.term}"
      "$mod, B, exec, uwsm app -- ${settings.browser}"
      "$mod, C, exec, uwsm app -- gnome-calculator"
      "$mod, D, exec, uwsm app -- nautilus"
      "$mod, T, exec, uwsm app -- telegram-desktop"
      "$mod, O, exec, uwsm app -- obsidian"
      "$mod, N, exec, uwsm app -- neovide"
      "$mod CTRL, S, exec, __NV_PRIME_RENDER_OFFLOAD=1 __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0 __GLX_VENDOR_LIBRARY_NAME=nvidia __VK_LAYER_NV_optimus=NVIDIA_only uwsm app --  steam"
      "$mod CTRL, O, exec, uwsm app -- osu\!"
      "$mod CTRL, N, exec, notify-send $(hyprctl activewindow | grep class)"

      # Special workspace
      "$mod, S, togglespecialworkspace"
      "$mod SHIFT, S, movetoworkspacesilent, special"

      # Launcher
      "$mod SHIFT, A, exec, uwsm app -- ags -t launcher"

      # Screenshot / Screencast
      "$mod SHIFT, Z, exec, uwsm app -- hyprshot --freeze -m region --clipboard-only"
      "$mod SHIFT, R, exec, uwsm app -- sh -c 'hyprrecord'"

      # Move window focus with vim keys.
      "$mod, h, movefocus, l"
      "$mod, l, movefocus, r"
      "$mod, k, movefocus, u"
      "$mod, j, movefocus, d"

      # Music control
      "$mod ALT, m, exec, pulsemixer --id $(pulsemixer --list-sources | cut -f3 | grep 'Default' | cut -d ',' -f 1 | cut -c 6-) --toggle-mute"
      ", XF86AudioMicMute, exec, pulsemixer --id $(pulsemixer --list-sources | cut -f3 | grep 'Default' | cut -d ',' -f 1 | cut -c 6-) --toggle-mute"
      ", XF86AudioMute, exec, pulsemixer --id $(pulsemixer --list-sinks | cut -f3 | grep 'Default' | cut -d ',' -f 1 | cut -c 6-) --toggle-mute"
      "$mod ALT, l, exec, hyprmusic next"
      "$mod ALT, h, exec, hyprmusic previous"
      "$mod ALT, p, exec, hyprmusic play-pause"

      # Swap windows with vim keys
      "$mod SHIFT, h, swapwindow, l"
      "$mod SHIFT, l, swapwindow, r"
      "$mod SHIFT, k, swapwindow, u"
      "$mod SHIFT, j, swapwindow, d"

      # Move monitor focus.
      "$mod, TAB, focusmonitor, +1"

      # Switch workspaces.
      "$mod, 1, exec, hyprworkspace 1"
      "$mod, 2, exec, hyprworkspace 2"
      "$mod, 3, exec, hyprworkspace 3"
      "$mod, 4, exec, hyprworkspace 4"
      "$mod, 5, exec, hyprworkspace 5"
      "$mod, 6, exec, hyprworkspace 6"
      "$mod, 7, exec, hyprworkspace 7"
      "$mod, 8, exec, hyprworkspace 8"
      "$mod, 9, exec, hyprworkspace 9"
      "$mod, 0, exec, hyprworkspace 10"

      "$mod CTRL, h, workspace, r-1"
      "$mod CTRL, l, workspace, r+1"

      # Scroll through monitor workspaces with mod + scroll
      "$mod, mouse_down, workspace, r-1"
      "$mod, mouse_up, workspace, r+1"
      "$mod, mouse:274, killactive,"

      # Move active window to a workspace.
      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
      "$mod SHIFT, 9, movetoworkspace, 9"
      "$mod SHIFT, 0, movetoworkspace, 10"
      "$mod CTRL SHIFT, l, movetoworkspace, r+1"
      "$mod CTRL SHIFT, h, movetoworkspace, r-1"
    ];
  };

  wayland.windowManager.hyprland.extraConfig = ''
    # will switch to a submap called resize
    bind=$mod,R,exec,echo -n "Resize" > /tmp/hypr_submap
    bind=$mod,R,submap,resize

    # will start a submap called "resize"
    submap=resize

    # sets repeatable binds for resizing the active window
    binde=,l,resizeactive,30 0
    binde=,h,resizeactive,-30 0
    binde=,k,resizeactive,0 -30
    binde=,j,resizeactive,0 30

    # use reset to go back to the global submap
    bind=,escape,exec,truncate -s 0 /tmp/hypr_submap
    bind=,escape,submap,reset

    # will reset the submap, meaning end the current one and return to the global one
    submap=reset
  '';
}
