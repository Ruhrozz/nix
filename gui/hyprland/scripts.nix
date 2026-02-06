{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jq
    libnotify
    playerctl
    slurp
    wf-recorder

    (pkgs.writeScriptBin "hyprrecord" ''
      #!/usr/bin/env bash

      if pgrep -x "wf-recorder" > /dev/null
      then
          pkill -x "wf-recorder"
      else
          outpath="$HOME/Screencasts/screencast_$(date +'%Y-%m-%d_%H-%M-%S').mp4"
          mkdir -p "$HOME/Screencasts"
          wf-recorder -g "$(slurp)" -f "$outpath"
          notify-send -h string:x-canonical-append:"" "Screencast Info" "Video saved to $outpath"
      fi
    '')

    (pkgs.writeScriptBin "hyprworkspace" ''
      #!/usr/bin/env bash
      # close special workspace on focused monitor if one is present

      active=$(hyprctl -j monitors | jq --raw-output '.[] | select(.focused==true).specialWorkspace.name | split(":") | if length > 1 then .[1] else "" end')

      if [[ ''${#active} -gt 0 ]]; then
        hyprctl dispatch togglespecialworkspace "$active"
      fi

      hyprctl dispatch workspace "$1"
    '')
    
    (pkgs.writeScriptBin "hyprmusic" ''
      #!/bin/sh
      set -euo pipefail
      case "''${1:-}" in
        next)
          MEMBER=Next
          ;;

        previous)
          MEMBER=Previous
          ;;

        play)
          MEMBER=Play
          ;;

        pause)
          MEMBER=Pause
          ;;

        play-pause)
          MEMBER=PlayPause
          ;;

        *)
          echo "Usage: $0 next|previous|play|pause|play-pause"
          exit 1
          ;;

      esac

      exec dbus-send                                                \
        --print-reply                                               \
        --dest="org.mpris.MediaPlayer2.$(playerctl -l | head -n 1)" \
        /org/mpris/MediaPlayer2                                     \
        "org.mpris.MediaPlayer2.Player.$MEMBER"
    '')
  ];
}
