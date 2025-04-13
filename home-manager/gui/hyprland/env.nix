{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    env = [
      "XDG_CURRENT_DESKTOP,Hyprland"
      "XDG_SESSION_TYPE,wayland"
      "XDG_SESSION_DESKTOP,Hyprland"

      "QT_AUTO_SCREEN_SCALE_FACTOR,1"
      "QT_QPA_PLATFORM,wayland;xcb"
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"

      "MOZ_ENABLE_WAYLAND,1"

      # nvidia
      # "GBM_BACKEND,nvidia-drm"
      # "LIBVA_DRIVER_NAME,nvidia"
      # "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      # "__GL_GSYNC_ALLOWED"
      # "__GL_VRR_ALLOWED"
    ];
  };
}
