{
  programs.hyprlock.enable = true;
  programs.hyprlock.settings = {
    general = {
      grace = 0;
      ignore_empty_input = true;
    };

    background = {
      blur_passes = 3;
      blur_size = 3;
      brightness = 1.0;
      contrast = 1.0;
      noise = 2.0e-2;
    };

    input-field = {
      monitor = "";
      size = "250, 50";
      outline_thickness = 0;
      dots_size = 0.26;
      dots_spacing = 0.64;
      dots_center = true;
      fade_on_empty = true;
      placeholder_text = "<i>Password...</i>";
      hide_input = false;
      position = "0, 50";
      halign = "center";
      valign = "bottom";
    };
  };
  programs.hyprlock.extraConfig = ''
    label {
        monitor =
        text = cmd[update:1000] echo "<b><big> $(date +"%h:%m") </big></b>"

        font_size = 64
        font_family = Hack Nerd Font

        position = 0, -70
        halign = center
        valign = center
    }

    label {
        monitor =
        text = $LAYOUT

        font_size = 12
        font_family = Hack Nerd Font

        position = 0, 20
        halign = center
        valign = bottom
    }

    label {
        monitor =
        text = cmd[update:18000000] echo "<b> "$(date +'%A, %-d %B %Y')" </b>"

        font_size = 24
        font_family = Hack Nerd Font

        position = 0, -120
        halign = center
        valign = center
    }
  '';
}
