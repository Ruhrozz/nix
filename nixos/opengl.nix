{ pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      libGL
      glib.out
    ]; # after that libgl.so appears in /run/opengl-driver/
  };
}
