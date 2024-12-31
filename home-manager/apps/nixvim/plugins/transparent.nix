{
  programs.nixvim.plugins.transparent = {
    enable = true;
    settings = {
      extra_groups = [
        "all"
        "TroubleNormal"
        "TroubleNormalNC"
        "TroubleCount"
        "TroubleFsCount"
        "TelescopeBorder"
        "DiagnosticSignError"
        "DiagnosticSignWarn"
        "DiagnosticSignWarn"
        "DiagnosticSignInfo"
        "DiagnosticSignHint"
      ];
      exclude_groups = [ "StatusLine" "CursorLine" ];
    };
  };
}
