{ settings, config, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = false;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
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

    envExtra = ''
      setopt nonomatch
    '';

    sessionVariables = {
      ZSH_DISABLE_COMPFIX = true;
      UV_CACHE_DIR = "$HOME/.cache/uv/";
      UV_LINK_MODE = "symlink";
      TERM = "xterm-256color";
    };

    shellAliases = {
      hms = "home-manager switch --flake ${settings.dotfilesDir} -b nixhmbak";
      nrs = "sudo nixos-rebuild switch --flake ${settings.dotfilesDir}";

      # utils
      icat = "kitty +kitten icat --align left";
      cat = "bat";
      ls = "eza";
      clear = "clear -x";
      rs = "rsync -ah --info=progress2";
      find_suffix = ''
        find . -type f | sed 's/.*\.//' | sort -u
      '';

      # tmux
      ta = "tmux attach";
      tn = "tmux new";

      # linux
      C0 = "CUDA_VISIBLE_DEVICES=0";
      C1 = "CUDA_VISIBLE_DEVICES=1";
      C2 = "CUDA_VISIBLE_DEVICES=2";
      C3 = "CUDA_VISIBLE_DEVICES=3";
    };

    history = {
      size = 100000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };
}
