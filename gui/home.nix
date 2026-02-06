{ username, inputs, ... }:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit username inputs; };
  home-manager.users.${username}.imports = [
    ../home.nix
    ./waybar
    ./kitty.nix
    ./hyprland
    ./hm-packages.nix
    ./notification-daemon.nix
  ];
}
