{ lib, settings, ... }: {
  programs.starship = {
    enable = true;
    settings = {
      "$schema" = "https://starship.rs/config-schema.json";

      format = lib.concatStringsSep "" [
        "[](fg:overlay0)"
        "$os"
        "$hostname"
        "[](fg:overlay0 bg:surface2)"
        "$git_branch"
        "$git_status"
        "[](fg:surface2 bg:surface1)"
        "$c"
        "$python"
        "[](fg:surface1 bg:surface0)"
        "$nix_shell"
        "[](fg:surface0 bg:base)"
        "$time"
        "[](fg:base bg:mantle)"
        "$cmd_duration"
        "[ ](fg:mantle)"
        "\n\n"
        "$directory"
        "$character"
      ];

      os = {
        style = "bg:overlay0 fg:base";
        disabled = false;
      };

      hostname = {
        format = "[$hostname]($style)";
        style = "bg:overlay0 fg:base";
      };

      directory = {
        style = "fg:bold blue";
        format = "[$path ]($style)";
        truncate_to_repo = false; # TODO: make a collab with z/zoxide
      };

      character = {
        success_symbol = "  [❯](green)";
        error_symbol = "[[󰭿 ](red) ❯](green)";
        vimcmd_symbol = "[ ❮](subtext1)"; # For use with zsh-vi-mode
      };

      c = {
        style = "bg:surface1 fg:text";
        format = "[ $symbol ($version) ]($style)";
      };

      python = {
        style = "bg:surface1 fg:text";
        format = "[ $symbol ($version )(\\($virtualenv\\) )]($style)";
      };

      git_branch = {
        style = "bg:surface2 fg:text";
        format = "[ $symbol $branch ]($style)";
      };

      git_status = {
        style = "bg:surface2 fg:text";
        format = "[$all_status$ahead_behind ]($style)";
      };

      nix_shell = {
        style = "bg:surface0 fg:text";
        format = "[ via $symbol$state( ($name)) ]($style)";
        symbol = "❄️";
        impure_msg = "";
        pure_msg = "";
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:base fg:text";
        format = "[ $time ]($style)";
      };

      cmd_duration = {
        format = "[ took $duration ]($style)";
        style = "bg:mantle fg:text";
      };

      # Print a new line at the start of the prompt
      add_newline = true;

      palette = "catppuccin-mocha";

      # A copy-paste from here https://starship.rs/presets/nerd-font
      # (but not all of that)

      os.symbols = {
        Android = "  ";
        Arch = "  ";
        CentOS = "  ";
        Debian = "  ";
        Fedora = "  ";
        Kali = "  ";
        Linux = "  ";
        Macos = "  ";
        Mint = "  ";
        NixOS = "  ";
        Raspbian = "  ";
        Ubuntu = "  ";
        Unknown = "  ";
        Void = "  ";
        Windows = " 󰍲 ";
      };

      c.symbol = " ";
      docker_context.symbol = " ";
      git_branch.symbol = "";
      package.symbol = "󰏗 ";
      python.symbol = " ";

      # Yet another one copy-paste from https://github.com/catppuccin/starship

      palettes.catppuccin-latte = {
        rosewater = "#dc8a78";
        flamingo = "#dd7878";
        pink = "#ea76cb";
        mauve = "#8839ef";
        red = "#d20f39";
        maroon = "#e64553";
        peach = "#fe640b";
        yellow = "#df8e1d";
        green = "#40a02b";
        teal = "#179299";
        sky = "#04a5e5";
        sapphire = "#209fb5";
        blue = "#1e66f5";
        lavender = "#7287fd";
        text = "#4c4f69";
        subtext1 = "#5c5f77";
        subtext0 = "#6c6f85";
        overlay2 = "#7c7f93";
        overlay1 = "#8c8fa1";
        overlay0 = "#9ca0b0";
        surface2 = "#acb0be";
        surface1 = "#bcc0cc";
        surface0 = "#ccd0da";
        base = "#eff1f5";
        mantle = "#e6e9ef";
        crust = "#dce0e8";
      };

      palettes.catppuccin-frappe = {
        rosewater = "#f2d5cf";
        flamingo = "#eebebe";
        pink = "#f4b8e4";
        mauve = "#ca9ee6";
        red = "#e78284";
        maroon = "#ea999c";
        peach = "#ef9f76";
        yellow = "#e5c890";
        green = "#a6d189";
        teal = "#81c8be";
        sky = "#99d1db";
        sapphire = "#85c1dc";
        blue = "#8caaee";
        lavender = "#babbf1";
        text = "#c6d0f5";
        subtext1 = "#b5bfe2";
        subtext0 = "#a5adce";
        overlay2 = "#949cbb";
        overlay1 = "#838ba7";
        overlay0 = "#737994";
        surface2 = "#626880";
        surface1 = "#51576d";
        surface0 = "#414559";
        base = "#303446";
        mantle = "#292c3c";
        crust = "#232634";
      };

      palettes.catppuccin-macchiato = {
        rosewater = "#f4dbd6";
        flamingo = "#f0c6c6";
        pink = "#f5bde6";
        mauve = "#c6a0f6";
        red = "#ed8796";
        maroon = "#ee99a0";
        peach = "#f5a97f";
        yellow = "#eed49f";
        green = "#a6da95";
        teal = "#8bd5ca";
        sky = "#91d7e3";
        sapphire = "#7dc4e4";
        blue = "#8aadf4";
        lavender = "#b7bdf8";
        text = "#cad3f5";
        subtext1 = "#b8c0e0";
        subtext0 = "#a5adcb";
        overlay2 = "#939ab7";
        overlay1 = "#8087a2";
        overlay0 = "#6e738d";
        surface2 = "#5b6078";
        surface1 = "#494d64";
        surface0 = "#363a4f";
        base = "#24273a";
        mantle = "#1e2030";
        crust = "#181926";
      };

      palettes.catppuccin-mocha = {
        rosewater = "#f5e0dc";
        flamingo = "#f2cdcd";
        pink = "#f5c2e7";
        mauve = "#cba6f7";
        red = "#f38ba8";
        maroon = "#eba0ac";
        peach = "#fab387";
        yellow = "#f9e2af";
        green = "#a6e3a1";
        teal = "#94e2d5";
        sky = "#89dceb";
        sapphire = "#74c7ec";
        blue = "#89b4fa";
        lavender = "#b4befe";
        text = "#cdd6f4";
        subtext1 = "#bac2de";
        subtext0 = "#a6adc8";
        overlay2 = "#9399b2";
        overlay1 = "#7f849c";
        overlay0 = "#6c7086";
        surface2 = "#585b70";
        surface1 = "#45475a";
        surface0 = "#313244";
        base = "#1e1e2e";
        mantle = "#181825";
        crust = "#11111b";
      };
    };
  };
}
