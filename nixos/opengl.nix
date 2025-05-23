{ pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      libGL
      glib.out
    ]; # after that libgl.so appears in /run/opengl-driver/
  };
}
