{ config, ... }:

{
  programs.htop = {
    enable = true;
    settings = {
      color_scheme = 6;
      cpu_count_from_one = 0;
      delay = 15;
      fields = with config.lib.htop.fields; [
        PID
        USER
        STATE
        PRIORITY
        NICE
        M_RESIDENT
        PERCENT_CPU
        PERCENT_MEM
        IO_READ_RATE
        IO_WRITE_RATE
        COMM
      ];
      highlight_base_name = 1;
      highlight_megabytes = 1;
      highlight_threads = 1;
    } // (with config.lib.htop; leftMeters [ (bar "AllCPUs4") (bar "Memory") ])
      // (with config.lib.htop;
        rightMeters [
          (text "Tasks")
          (text "LoadAverage")
          (text "Uptime")
          (text "Systemd")
        ]);
  };
}
