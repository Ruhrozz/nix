{
  programs.nixvim.plugins.git-conflict = {
    enable = true;
    autoLoad = true;
    settings = {
      default_commands = true;
      disable_diagnostics = false;
      list_opener = "copen";
      default_mappings = {
        ours = "co";
        theirs = "ct";
        none = "c0";
        both = "cb";
        next = "]x";
        prev = "[x";
      };
      highlights = {
        current = "DiffText";
        incoming = "DiffAdd";
      };
    };
  };
}
