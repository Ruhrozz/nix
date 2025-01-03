{ config, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = false;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
      # add binaries to PATH if they aren't added yet
      # affix colons on either side of $PATH to simplify matching
      case ":''${PATH}:" in
          *:"$HOME/.local/bin":*)
              ;;
          *)
              # Prepending path in case a system-installed binary needs to be overridden
              export PATH="$HOME/.local/bin:$PATH"
              ;;
      esac
    '';

    sessionVariables = {
      ZSH_DISABLE_COMPFIX = true;
      UV_CACHE_DIR = "$HOME/.cache/uv/";
      UV_LINK_MODE = "symlink";
      TERM = "xterm-256color";
    };

    shellAliases = {
      hms = "home-manager switch --flake ~/nix/home-manager/";

      # utils
      fuck = "THEFUCK_EXCLUDE_RULES=fix_file fuck";
      cat = "bat";
      ls = "eza";
      clear = "clear -x";

      # tmux
      ta = "tmux attach";
      tn = "tmux new";

      # pip
      plg = "pip list | grep";

      # linux
      C0 = "CUDA_VISIBLE_DEVICES=0";
      C1 = "CUDA_VISIBLE_DEVICES=1";
      C2 = "CUDA_VISIBLE_DEVICES=2";
      C3 = "CUDA_VISIBLE_DEVICES=3";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    # plugins = [
    #   {
    #     name = "powerlevel10k";
    #     src = pkgs.zsh-powerlevel10k;
    #     file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    #   }
    #   {
    #     name = "powerlevel10k-config";
    #     src = ./p10k-config;
    #     file = "p10k.zsh";
    #   }
    # ];

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };
}
