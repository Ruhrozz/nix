{ lib, ... }: {
  programs.starship = {
    enable = true;
    settings = {
      "$schema" = "https://starship.rs/config-schema.json";

      format = lib.concatStringsSep "" [
        "[](fg:base02)"
        "$os"
        "$hostname"
        "[](fg:base02 bg:base03)"
        "$git_branch"
        "$git_status"
        "[](fg:base03 bg:base04)"
        "$c"
        "$python"
        "[](fg:base04 bg:base03)"
        "$nix_shell"
        "[](fg:base03 bg:base02)"
        "$time"
        "[](fg:base02 bg:base01)"
        "$cmd_duration"
        "[ ](fg:base01)"
        "\n\n"
        "$directory"
        "$character"
      ];

      os = {
        style = "bg:base02";
        disabled = false;
      };

      hostname = {
        format = "[$hostname ]($style)";
        style = "bg:base02";
      };

      directory = {
        style = "bold fg:blue";
        format = "[$path ]($style)";
        truncate_to_repo = false; # TODO: make a collab with z/zoxide
      };

      character = {
        success_symbol = "  [❯](green)";
        error_symbol = "[[󰭿 ](red) ❯](green)";
        vimcmd_symbol = "[ ❮](base09)"; # For use with zsh-vi-mode
      };

      c = {
        style = "bg:base04";
        format = "[ $symbol ($version) ]($style)";
      };

      python = {
        style = "bg:base04";
        format = "[ $symbol ($version )(\\($virtualenv\\) )]($style)";
      };

      git_branch = {
        style = "bg:base03";
        format = "[ $symbol $branch ]($style)";
      };

      git_status = {
        style = "bg:base03";
        format = "[$all_status$ahead_behind ]($style)";
      };

      nix_shell = {
        style = "bg:base03";
        format = "[ via $symbol$state( ($name)) ]($style)";
        symbol = "❄️";
        impure_msg = "";
        pure_msg = "";
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:base02";
        format = "[ $time ]($style)";
      };

      cmd_duration = {
        format = "[ took $duration ]($style)";
        style = "bg:base01";
      };

      add_newline = true;

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
    };
  };
}
