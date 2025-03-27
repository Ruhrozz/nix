{
  description = "RuhOs";

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      settings = import (./. + "/settings.nix") { inherit pkgs; };
      pkgs = import nixpkgs { system = settings.system; };
    in {
      # NixOS + Home-Manager configuration entrypoint.
      nixosConfigurations = {
        ${settings.hostname} = nixpkgs.lib.nixosSystem {

          modules = [
            # Import NixOS and Disko configs here
            inputs.disko.nixosModules.disko
            (./. + "/profiles" + ("/" + settings.profile)
              + "/configuration.nix")
            # Import Home-Manager and Stylix configs here
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${settings.username}.imports = [
                  inputs.nixvim.homeManagerModules.nixvim
                  inputs.stylix.homeManagerModules.stylix
                  (./profiles + ("/" + settings.profile) + "/home.nix")
                ];
                extraSpecialArgs = {
                  inherit inputs;
                  inherit settings;
                };
              };
            }
            # In case that someone will want to connect to this host with VSCode
            inputs.vscode-server.nixosModules.default
            { services.vscode-server.enable = true; }
          ];

          specialArgs = {
            inherit inputs;
            inherit settings;
          };
        };
      };

      # Standalone home-manager configuration entrypoint.
      homeConfigurations = {
        ${settings.username} = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${settings.system};

          modules = [
            (./. + "/profiles" + ("/" + settings.profile) + "/home.nix")
            inputs.stylix.homeManagerModules.stylix
            inputs.nixvim.homeManagerModules.nixvim
          ];

          extraSpecialArgs = {
            inherit inputs;
            inherit settings;
          };
        };
      };
    };

  inputs = {
    # Required package
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    # For widgets like status bar at the top
    ags = {
      url = "github:Aylur/ags/v1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # For customizing system
    stylix = {
      url = "github:danth/stylix/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # For connection to this machine with VSCode
    vscode-server = {
      url = "github:nix-community/nixos-vscode-server";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # For handling dotfiles in ~/.config/
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Customizing my neovim config
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Declarative disk partitioning
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # hypr-dynamic-cursors = {
    #   url = "github:VirtCode/hypr-dynamic-cursors";
    #   inputs.hyprland.follows =
    #     "hyprland"; # to make sure that the plugin is built for the correct version of hyprland
    # };
  };
}
