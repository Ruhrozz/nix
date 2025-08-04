{ pkgs, lib, settings, ... }:

let details = settings.themeDetails;
in {
  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    image = details.wallpaper;
    base16Scheme = lib.mkIf (details.themeName != null)
      "${pkgs.base16-schemes}/share/themes/${details.themeName}.yaml";
    override = lib.mkIf (details.override != null) details.override;
    opacity = {
      terminal = details.opacity;
      applications = details.opacity;
      desktop = details.opacity;
      popups = details.opacity;
    };

    fonts = {                                                                                                            
      sizes = {                                                                                                          
        desktop = 12;                                                                                                    
        terminal = 12;                                                                                                   
      };                                                                                                                 
      sansSerif = {                                                                                                      
        package = pkgs.nerd-fonts.dejavu-sans-mono;                                                                      
        name = "DejaVuSansM Nerd Font";                                                                                  
      };                                                                                                                 
      monospace = {                                                                                                      
        package = pkgs.nerd-fonts.dejavu-sans-mono;                                                                      
        name = "DejaVuSansM Nerd Font Mono";                                                                             
      };                                                                                                                 
    };   

    cursor = {
      size = 32;
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
    };

    targets = {
      nixvim.enable = true;
      tmux.enable = true;
      hyprland.enable = true;
      hyprpaper.enable = true;
      waybar.enable = true;
      swaync.enable = true;
      starship.enable = false;
      kitty = {                                                                                                          
        enable = true;                                                                                                   
        variant256Colors = true;                                                                                         
      };
    };
  };
}
