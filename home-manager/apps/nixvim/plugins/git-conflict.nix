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
        next = "]c";
        prev = "[c";
      };
      highlights = {
        current = "DiffText";
        incoming = "DiffAdd";
      };
    };
  };
}
